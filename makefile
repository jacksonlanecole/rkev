# Muchas gracias a Hilton Lipschitz por este makefile. Se ecuentra a
# https://hiltmon.com/blog/2013/07/03/a-simple-c-plus-plus-project-structure/
CC = g++
CFLAGS = -std=c++11

SRCDIR   := src
BUILDDIR := build
TARGET   := bin/main

SRCEXT   := cpp
SOURCES  := $(shell find $(SRCDIR) -type f -name \*.$(SRCEXT))
OBJECTS  := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))
INC      := -I include

$(TARGET): $(OBJECTS)
	@echo "Linking..."
	@echo " $(CC) $^ -o $(TARGET) $(LIB)"; $(CC) $^ -o $(TARGET) $(LIB)

$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	@mkdir -p $(BUILDDIR)
	@echo "$(CC) $(CFLAGS) $(INC) -c -o $@ $<"; $(CC) $(CFLAGS) $(INC) -c -o $@ $<

clean:
	@echo " Cleaning...";
	@echo " $(RM) -r $(BUILDDIR) $(TARGET)"; $(RM) -r $(BUILDDIR) $(TARGET)

# Tests
tester:
	$(CC) $(CFLAGS) test/tester.cpp $(INC) $(LIB) -o bin/tester
main: $(TARGET)
	@echo "$(CC) $(CFLAGS) -o $(TARGET) $^"
