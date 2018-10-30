package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strings"
)

// ctci-making-anagrams.go
// author: Seong Yong-ju <sei40kr@gmail.com>

// Complete the makeAnagram function below.
func makeAnagram(a string, b string) int32 {
	var counts ['z' - 'a' + 1]int32

	for _, c := range a {
		counts[c-'a'] += 1
	}
	for _, c := range b {
		counts[c-'a'] -= 1
	}

	var ans int32 = 0
	for _, count := range counts {
		if count > 0 {
			ans += count
		} else {
			ans -= count
		}
	}

	return ans
}

func main() {
	reader := bufio.NewReaderSize(os.Stdin, 1024*1024)

	stdout, err := os.Create(os.Getenv("OUTPUT_PATH"))
	checkError(err)

	defer stdout.Close()

	writer := bufio.NewWriterSize(stdout, 1024*1024)

	a := readLine(reader)

	b := readLine(reader)

	res := makeAnagram(a, b)

	fmt.Fprintf(writer, "%d\n", res)

	writer.Flush()
}

func readLine(reader *bufio.Reader) string {
	str, _, err := reader.ReadLine()
	if err == io.EOF {
		return ""
	}

	return strings.TrimRight(string(str), "\r\n")
}

func checkError(err error) {
	if err != nil {
		panic(err)
	}
}
