JSON_DATA_FILE := ../app/assets/data/vacancies.json

update:
	make run > $(JSON_DATA_FILE)

# The `python -m json.tool` is just there to pretty-print
# the JSON output. It can be omitted.
run:
	@bin/current-vacancies-to-json.rb | python -m json.tool

# `entr` is a file-watcher. See; http://entrproject.org
# This runs the tests whenever any file is changed
test-watch:
	find * | entr rspec

