CXX = g++
CXXFLAGS = -std=c++17
TARGET = spiro

all: $(TARGET) spirographs

$(TARGET): spiro.cpp
	$(CXX) $(CXXFLAGS) -o $(TARGET) spiro.cpp

spirographs: $(TARGET) input1.txt input2.txt input3.txt input4.txt input5.txt
	./$(TARGET) 96 10.0 < input1.txt 2> /dev/null | jgraph -P > spiro1.ps
	ps2pdf spiro1.ps spiro1.pdf
	convert spiro1.ps spiro1.jpg
	./$(TARGET) 96 10.0 < input2.txt 2> /dev/null | jgraph -P > spiro2.ps
	ps2pdf spiro2.ps spiro2.pdf
	convert spiro2.ps spiro2.jpg
	./$(TARGET) 120 12.0 < input3.txt 2> /dev/null | jgraph -P > spiro3.ps
	ps2pdf spiro3.ps spiro3.pdf
	convert spiro3.ps spiro3.jpg
	./$(TARGET) 96 10.0 < input4.txt 2> /dev/null | jgraph -P > spiro4.ps
	ps2pdf spiro4.ps spiro4.pdf
	convert spiro4.ps spiro4.jpg
	./$(TARGET) 144 15.0 < input5.txt 2> /dev/null | jgraph -P > spiro5.ps
	ps2pdf spiro5.ps spiro5.pdf
	convert spiro5.ps spiro5.jpg

clean:
	rm -f $(TARGET) *.pdf *.ps *.jpg

.PHONY: all clean spirographs
