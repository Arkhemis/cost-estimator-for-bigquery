.PHONY: package clean

package:
	rm -f package.zip
	zip -qrX package.zip manifest.json LICENSE README.md css images scripts

clean:
	rm -f package.zip
