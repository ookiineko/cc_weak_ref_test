CFLAGS += -D_GNU_SOURCE=1 -D_POSIX_SOURCE=1 -O2
LDFLAGS += -s
TEST_PASS_SRCS := main.c lib.c
TEST_PASS_OBJS := $(TEST_PASS_SRCS:%.c=%.o)
TEST_PASS_CFLAGS :=
TEST_PASS_EXEC := test_pass
TEST_FAIL_SRCS := main.c
TEST_FAIL_OBJS := $(TEST_FAIL_SRCS:%.c=%.o)
TEST_FAIL_CFLAGS :=
TEST_FAIL_EXEC := test_fail
TEST_OBJS := $(TEST_PASS_OBJS) $(TEST_FAIL_OBJS)
TEST_EXECS := $(TEST_PASS_EXEC) $(TEST_FAIL_EXEC)
NO_FAIL := $(shell ([[ -f no_fail.flag ]] && echo 1) || echo 0)

run: clean $(TEST_PASS_EXEC) $(TEST_FAIL_EXEC)
	@echo -n 'Should pass: '
	@RUN_RESULT=$$(./$(TEST_PASS_EXEC)); \
        if [ $$? -ne 0 ]; then \
		echo "Test failed (Output: $${RUN_RESULT})"; \
		false; \
	else \
		if [ "$$RUN_RESULT" = "" ]; then \
			echo Unknown; \
			false; \
		else \
			echo $$RUN_RESULT; \
		fi \
	fi
ifeq ($(NO_FAIL),0)
	@echo -n 'Should fail: '
	@RUN_RESULT=$$(./$(TEST_FAIL_EXEC)); \
	if [ $$? -ne 1 ]; then \
		echo "Unexpected pass (Output: $${RUN_RESULT})"; \
		false; \
	else \
		if [ "$$RUN_RESULT" = "" ]; then \
			echo Unknown; \
			false; \
		else \
			echo $$RUN_RESULT; \
		fi \
	fi
endif
	@make -s clean
	@echo Everything is OK

$(TEST_PASS_EXEC): $(TEST_PASS_SRCS)
	@$(CC) $^ $(CFLAGS) $(TEST_PASS_CFLAGS) $(LDFLAGS) -o $@

$(TEST_FAIL_EXEC): $(TEST_FAIL_SRCS)
	@$(CC) $^ $(CFLAGS) $(TEST_FAIL_CFLAGS) $(LDFLAGS) -o $@

clean:
	@rm -f $(TEST_OBJS) $(TEST_EXECS)
