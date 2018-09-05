package main

import (
	"testing"
)

// count-triplets-1_test.go --- Count Triplets
// author: Seong Yong-ju <sei40kr@gmail.com>

func TestCountTriplets(t *testing.T) {
	type args struct {
		arr []int64
		r   int64
	}
	tests := []struct {
		name string
		args args
		want int64
	}{
		{"Sample Input 0", args{[]int64{1, 2, 2, 4}, 2}, 2},
		{"Sample Input 1", args{[]int64{1, 3, 9, 9, 27, 81}, 3}, 6},
		{"Sample Input 2", args{[]int64{1, 5, 5, 25, 125}, 5}, 4},
		{"Custom Input", args{[]int64{1, 1, 1, 1, 1}, 1}, 10},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := CountTriplets(tt.args.arr, tt.args.r); got != tt.want {
				t.Errorf("CountTriplets() = %v, want %v", got, tt.want)
			}
		})
	}
}
