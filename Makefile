SHELL := /bin/bash
TEST_SUBDIRS := weak0 weak1 weak2 weak3

all:
	@pass_count=0; \
	fail_count=0; \
	total_count=0; \
	for test_subdir in $(TEST_SUBDIRS); do \
		echo "========================= Running test '$${test_subdir}': ========================="; \
		make -s -C $$test_subdir; \
		if [ $$? -eq 0 ]; then \
			pass_count=$$(($$pass_count + 1)); \
		else \
			fail_count=$$(($$fail_count + 1)); \
		fi; \
		total_count=$$(($$total_count + 1)); \
	done; \
	echo '========================= Summary ========================='; \
	echo "$${pass_count} test(s) of $${total_count} passed, $${fail_count} test(s) failed"; \
	if [ $$fail_count -eq 0 ]; then \
		echo 'All test(s) were PASSED'; \
	else \
		echo 'Some test(s) were FAILED'; \
	fi

clean:
	@set -e; \
	for test_subdir in $(TEST_SUBDIRS); do \
		make -C $$test_subdir clean; \
	done
