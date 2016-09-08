
# FIXME: script-mpe too big to use as submodule
scriptdir=vendor/script-mpe
scriptname=compose-image
. $scriptdir/util.sh


# this is used in jenins-userContent
# ci-build-composite base-img "title"
cmd_ci_build_composite_baseimg()
{
	baseimg="$(echo media/image/*/$1.png)"

	test -e "$baseimg" || {
		error "No image for $1" 1
	}

	# Convert to larger size for compositing.
	# Size will be max 1000 w/h with aspect preserved.
	convert -resize 1000x1000 \
		"$baseimg" \
		/tmp/$(basename $baseimg .png)-tmp.png

	# Extend the canvas a bit lower right
	convert -background none -extent 1100x1100 \
		/tmp/$(basename $baseimg .png)-tmp.png \
		/tmp/$(basename $baseimg .png).png
}

cmd_ci_build_composite_emblem()
{
	tagimg="$(echo media/image/*/$3.png)"
}

# ci-build-composite base-img "title" tags..
cmd_ci_build_composite()
{
	cmd_ci_build_composite_baseimg "$1" "$2"
	shift 2

	cnt=0
	for tag in "$@"
	d
		test "$(echo media/image/*/$tag.png)" != "media/image/*/$tag.png" \
			|| continue
		cnt=$(( $cnt + 1 ))
		cmd_ci_build_composite_emblem $out $cnt $tag
	done
}


# Main
if [ -n "$0" ] && [ $0 != "-bash" ]; then

	# Do something (only) if script invoked as '$scriptname[.sh]'
	base=$(basename $0 .sh)
	case "$base" in

		$scriptname )

			# function name first as argument,
			cmd=$1
			[ -n "$def_func" -a -z "$cmd" ] \
				&& func="$def_func" \
				|| func="$(echo cmd_$cmd | tr '-' '_')"

			# load/exec if func exists
			type $func &> /dev/null && {
				func_exists=1
				load
				shift 1
				$func "$@"
			} || {
				# handle non-zero return or print usage for non-existant func
				e=$?
				[ -z "$cmd" ] && {
					load
					cmd_usage
					err 'No command given, see "help"' 1
				} || {
					[ "$e" = "1" -a -z "$func_exists" ] && {
						load
						cmd_usage
						err "No such command: $cmd" 1
					} || {
						err "Command $cmd returned $e" $e
					}
				}
			}

			;;

		* )
			echo No frontend for $base

	esac
fi

# vim:ft=bash:noet:

