# Nazwa docelowego pliku wykonywalnego (zmieniona z 1_1 na 2)
TARGET = 2

# Nazwa pliku źródłowego asemblera (zmieniona z 1_1.s na 2.s)
SOURCE = $(TARGET).s

# Nazwa pliku obiektowego (zmieniona z 1_1.o na 2.o)
OBJECT = $(TARGET).o

# Flagi dla asemblera (GNU as)
ASFLAGS = --32 -g

# Flagi dla linkera (GNU ld)
LDFLAGS = -m elf_i386 -g

# Domyślny cel - kompilacja, uruchomienie i wyświetlenie wyniku
all: $(TARGET) run hexdump

# Reguła kompilacji: tworzenie pliku wykonywalnego z pliku obiektowego
$(TARGET): $(OBJECT)
	ld $(LDFLAGS) -o $@ $<

# Reguła asemblacji: tworzenie pliku obiektowego z pliku źródłowego .s
$(OBJECT): $(SOURCE)
	as $(ASFLAGS) -o $@ $<

# Reguła uruchomienia: uruchamia program i przekierowuje wynik do pliku 'out'
run: $(TARGET)
	./$(TARGET) > out

# Reguła wyświetlenia wyniku za pomocą hexdump -C
hexdump: run
	hexdump -C out

# Reguła czyszczenia: usuwa skompilowane pliki i pliki wyjściowe
clean:
	rm -f $(TARGET) $(OBJECT) out

# Definiuje 'all', 'run', 'hexdump' i 'clean' jako cele pseudo-pliki
.PHONY: all run hexdump clean
