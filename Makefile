# Example Makefile
.PHONY: docs

docs d:
	@python3 . .
	@cd docs && mdbook build