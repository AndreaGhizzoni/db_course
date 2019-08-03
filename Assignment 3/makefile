SUBMIT_FOLDER=submit
SUBMIT_ZIP=db2016_157507_171536.zip

# default option to make 
default: zip

zip: submit
	@if [ -e $(SUBMIT_ZIP) ]; then \
		@$(RM) -rf $(SUBMIT_ZIP);\
	fi
	cd $(SUBMIT_FOLDER);\
	zip ../$(SUBMIT_ZIP) creazione.sql importazione.sql query_00.sql query_2.sql \
	query_3.sql query_6.sql query_11.sql query_14.sql query_15.sql members.txt;\

submit:
	@if [ -d $(SUBMIT_FOLDER) ]; then \
		@$(RM) -rf $(SUBMIT_FOLDER);\
	fi
	@mkdir $(SUBMIT_FOLDER);\
	cp members.txt $(SUBMIT_FOLDER);\
	cd $(SUBMIT_FOLDER);\
	cp ../sql/creazione.sql .;\
    sed -i '1s/^/\\c db2016;\n/' creazione.sql;\
	cp ../sql/importazione.sql .;\
	sed -i '1s/^/\\c db2016;\n/' importazione.sql;\
	cp ../sql/query_00.sql .;\
	sed -i '1s/^/\\c db2016;\n/' query_00.sql;\
	cp ../sql/query_2.sql .;\
	sed -i '1s/^/\\c db2016;\n/' query_2.sql;\
	cp ../sql/query_3.sql .;\
    sed -i '1s/^/\\c db2016;\n/' query_3.sql;\
	cp ../sql/query_6.sql .;\
    sed -i '1s/^/\\c db2016;\n/' query_6.sql;\
	cp ../sql/query_11.sql .;\
    sed -i '1s/^/\\c db2016;\n/' query_11.sql;\
	cp ../sql/query_14.sql .;\
    sed -i '1s/^/\\c db2016;\n/' query_14.sql;\
	cp ../sql/query_15.sql .;\
    sed -i '1s/^/\\c db2016;\n/' query_15.sql;\
	cd ..;\

clear :
	$(RM) -rf $(SUBMIT_FOLDER) $(SUBMIT_ZIP)

