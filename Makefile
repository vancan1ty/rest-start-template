all: clean build extrareplace

build:
	mvn archetype:create-from-project -Darchetype.properties=archetypePFile.txt

extrareplace:
	sed -i 's/com.cvberry.reststart/$${groupId}/g' 'target/generated-sources/archetype/src/main/resources/archetype-resources/pom.xml' 

twothings: copyover gitcommit	

copyover:
	cp -R target/generated-sources/archetype/* ../rest-start/

gitcommit:
	(cd ../rest-start && git add . && git commit)

install:
	(cd ../rest-start && mvn install)

clean:
	mvn clean
	(cd ../rest-start && rm -Rf pom.xml src target)
