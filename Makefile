.PHONY: main docs

# Scan all directories with *docg and copy them to priv/documentation/src
# Then take all the SUMMARY.md files and concatenate them in a single SUMMARY.md
# Take all the md files at root and copy them to priv/documentation/src/root
#
# This shows an example way of doing this.
# Implement in Odin when feels ready.
docs d:
	@rm -rf priv/documentation/src
	@mkdir -p priv/documentation/src
	@cp -r lib/lib.docg priv/documentation/src

	@mkdir -p priv/documentation/src/root
	@cp CHANGELOG.md priv/documentation/src/root
	@cp LICENSE.md priv/documentation/src/root
	@cp README.md priv/documentation/src/root
	@cp CONTRIBUTING.md priv/documentation/src/root
	@cp AUTHORS.md priv/documentation/src/root
	@cp SUMMARY.md priv/documentation/src/root
	@cp -r priv/resources priv/documentation/src/root

	@cat priv/documentation/src/root/SUMMARY.md priv/documentation/src/lib.docg/SUMMARY.md > priv/documentation/src/SUMMARY.md
	@cd priv/documentation/ && mdbook build
	@rm -rf docs/
	@cp -r priv/documentation/book docs

main m:
	@odin run main.odin -file
