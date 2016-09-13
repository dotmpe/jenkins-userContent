.PHONY: default ant-init build-images


default: ant-init

update:
	git diff --quiet jenkins-ci.yaml || { \
		echo "jenkins-ci.yaml has local changed, clean git required" ;\
		exit 1 ;\
	}
	test ! -e .env.sh || . .env.sh; \
	echo CREDS_ID=$$CREDS_ID; \
	test -n "$$CREDS_ID" ; \
	sed -E -i.bak 's/credentials-id:\ ?[a-z0-9-]*$$/credentials-id: '"$$CREDS_ID"'/g' \
		jenkins-ci.yaml
	jenkins-jobs update jenkins-ci.yaml
	rm jenkins-ci.yaml.bak
	git co jenkins-ci.yaml


build:
	grunt

build-images:
	file -s media/image/icon/tilted-console-prompt.png
	file -s media/image/icon/bat.png
	convert -resize 1000x1000 \
		media/image/icon/tilted-console-prompt.png \
		media/image/icon/tilted-console-prompt-1000.png
	convert \
		media/image/icon/tilted-console-prompt-1000.png \
		-background none -extent 1100x1100 \
		media/image/icon/tilted-console-prompt-ext.png
	convert -resize 165x165^ \
		media/image/logo/tap.png \
		media/image/logo/tap-165.png
	convert \
		media/image/logo/tap-165.png \( -clone 0 -background black -shadow 80x20+4+4 \) -reverse -background none -layers merge +repage \
		media/image/logo/tap-shadow.png
	convert -resize 165x165^ \
		media/image/logo/jenkins-no-bg.png \
		media/image/logo/jenkins-no-bg-165.png
	convert \
		media/image/logo/jenkins-no-bg-165.png \( -clone 0 -background black -shadow 80x20+4+4 \) \
		-reverse -background none -layers merge +repage \
		media/image/logo/jenkins-no-bg-shadow.png
	convert -resize 165x165^ \
		media/image/icon/bat.png \
		media/image/icon/bat-165.png
	convert \
		media/image/icon/bat-165.png \( -clone 0 -background black -shadow 80x20+4+4 \) \
		-reverse -background none -layers merge +repage \
		media/image/icon/bat-shadow.png
	composite \
		-gravity SouthEast \
		-geometry +180 \
		media/image/icon/bat-shadow.png \
		media/image/icon/tilted-console-prompt-ext.png \
		ci-config-1000-a.png
	composite \
		-gravity SouthEast \
		-geometry +640 \
		media/image/logo/tap-shadow.png \
		ci-config-1000-b.png \
		ci-config-1000-c.png
	composite \
		-gravity SouthEast \
		-geometry +420 \
		media/image/logo/jenkins-no-bg-shadow.png \
		ci-config-1000-c.png \
		ci-config-1000.png
	convert -resize 400x400 \
		ci-config-1000.png \
		ci-config.png


