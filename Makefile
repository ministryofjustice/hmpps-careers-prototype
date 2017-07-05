server:
	npm start

update-vacancies-list:
	cd wcn-scraper; \
	make update

deploy:
	git push heroku master
