dockerfile-lint:
	@hadolint --ignore DL3006 jenkins/images/*/*
