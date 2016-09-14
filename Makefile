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
	cd media/image; make

