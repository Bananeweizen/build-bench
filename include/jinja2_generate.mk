# Makefile rules to build projects from jinja2 templates

# this one should be used
.PRECIOUS: $(CONFIGURED_BUILD_SOURCE)
$(CONFIGURED_BUILD_SOURCE): $(DOWNLOAD_SOURCES_DIR)/generated/$(SOURCE_PROJECT)
	@mkdir -p $(CONFIGURED_BUILD_SOURCE)
# softlinking causes problems with some tools (pants)
	@cp -rf $(DOWNLOAD_SOURCES_DIR)/generated/$(SOURCE_PROJECT)/* $(CONFIGURED_BUILD_SOURCE)

.PRECIOUS: $(DOWNLOAD_SOURCES_DIR)/generated/$(SOURCE_PROJECT)
$(DOWNLOAD_SOURCES_DIR)/generated/$(SOURCE_PROJECT):
	$(info Generating $(FILE_NUM) java source files)
	@python $(SCRIPTS_DIR)/apply-templates.py $(TEMPLATES_DIR)/$(SOURCE_PROJECT) $(DOWNLOAD_SOURCES_DIR)/generated/$(SOURCE_PROJECT) --subprojectnum=$(SUBPROJECT_NUM) --filenum=$(FILE_NUM)




