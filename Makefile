CXX = g++
CXXFLAGS = -std=c++17
TARGET = spiro

all: $(TARGET) spirographs

$(TARGET): spiro.cpp
	$(CXX) $(CXXFLAGS) -o $(TARGET) spiro.cpp

spirographs: $(TARGET) input1.txt input2.txt input3.txt input4.txt input5.txt
	./$(TARGET) 96 10.0 < input1.txt 2> /dev/null | jgraph -P | ps2pdf - spiro1.pdf
	./$(TARGET) 96 10.0 < input2.txt 2> /dev/null | jgraph -P | ps2pdf - spiro2.pdf
	./$(TARGET) 120 12.0 < input3.txt 2> /dev/null | jgraph -P | ps2pdf - spiro3.pdf
	./$(TARGET) 96 10.0 < input4.txt 2> /dev/null | jgraph -P | ps2pdf - spiro4.pdf
	./$(TARGET) 144 15.0 < input5.txt 2> /dev/null | jgraph -P | ps2pdf - spiro5.pdf

clean:
	rm -f $(TARGET) *.pdf *.ps *.jpg

.PHONY: all clean spirographs
