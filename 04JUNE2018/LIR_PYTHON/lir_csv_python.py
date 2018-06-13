import pandas as pd
import numpy as np
import time
import argparse
import sys

if len(sys.argv) != 6:
		print("This program requires the following 5 arguments seperated by a space ")
		print("iterations Row_START Row_STOP Col_START Col_STOP")
		exit(-57)

parser = argparse.ArgumentParser(description='Iteration and slicing operations')
parser.add_argument('integers', metavar='Iteration  + Slicing Parameters', type=int, nargs='+',
                    help='iterations, Row_START, Row_STOP, Col_START, Col_STOP')

args = parser.parse_args()
print("Command Line: ", args.integers[0], args.integers[1], args.integers[2], args.integers[3], args.integers[4])

iterations = args.integers[0]
row_start = args.integers[1]
row_stop = args.integers[2]
col_start = args.integers[3]
col_stop = args.integers[4]

treading = time.time()

print("Reading Data ....")
df = pd.read_csv('/phylanx-data/CSV/10kx10k.csv', sep=',', header=None)
df = df.values
print("Slicing ....")
X = df[row_start:row_stop , col_start:col_stop]
Y = np.squeeze(np.asarray(df[row_start:row_stop, 10000:10001]))
trslice = time.time()
print("Reading and Slicing done in ", trslice - treading, " s ")

print("Starting LIR ....")


tlra = time.time()


def MyLinearRegression(x, y, iterations, alpha):
		w = np.zeros(x.shape[1])
		Transx = x.transpose()
		for step in range(iterations):
				g = np.dot(x, w)
				error = g - y
		gradient = np.dot(Transx, error)
		w = w - alpha * gradient
		return w


weights = MyLinearRegression(X, Y, iterations, alpha = 1e-10)

tfinal = time.time()

print(" result = ", weights, " in time =", tfinal-tlra)


