package main

import (
	"bytes"
	"os"
	"strings"
	"testing"
)

func Test_solve(t *testing.T) {
	files, err := os.ReadDir("./test")
	if err != nil {
		t.Fatal(err)
	}

	for _, file := range files {
		if strings.HasSuffix(file.Name(), ".in") {
			testName := strings.TrimSuffix(file.Name(), ".in")
			inFile := "./test/" + file.Name()
			outFile := "./test/" + testName + ".out"

			t.Run(testName, func(t *testing.T) {
				w := &bytes.Buffer{}
				in, err := os.Open(inFile)
				if err != nil {
					t.Fatal(err)
				}
				defer in.Close()

				out, err := os.ReadFile(outFile)
				if err != nil {
					t.Fatal(err)
				}

				solve(in, w)
				wantW := string(out)
				if gotW := w.String(); gotW != wantW {
					t.Errorf("solve() = %v, want %v", gotW, wantW)
				}
			})
		}
	}
}
