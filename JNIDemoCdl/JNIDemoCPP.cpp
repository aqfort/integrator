/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include <jni.h>
#include <iostream>
#include "JNIDemoJava.h"

#include <vector>
#include <iomanip>
#include <algorithm>

#include <math.h>
#include <cmath>

#include <omp.h>

using namespace std;

///////////////////////////////////////////////////////

///////////////////////////////////////////////////////

jdouble* C;

typedef double (*pointFunc) (double);
double f(double x) {
    return (C[0] * pow(x,4) +
            C[1] * pow(x,3) +
            C[2] * pow(x,2) +
            C[3] * x +
            C[4] * sin(x) +
            C[5] * cos(x) +
            C[6] * exp(x) +
            C[7]);
}

double simpson_integral(pointFunc f, double a, double b, int n) {
    int i = 0;
    const double h = (b - a) / n;
    double k1 = 0, k2 = 0;
    
    ///////////////// parallel sum
    
    #pragma omp parallel for reduction(+: k1, k2)
    for(i = 1; i < n; i += 2) {
        k1 += f(a + i * h);
        k2 += f(a + (i + 1) * h);
    }
    
    return h / 3 * (f(a) + 4 * k1 + 2 * k2);
}


JNIEXPORT void JNICALL Java_jnidemojava_Main_nativePrintCPP
        (JNIEnv *env, jobject obj) {
    cout << "\nHello from C++!\n";
}

JNIEXPORT jint JNICALL Java_jnidemojava_Main_00024JNIFunction_multiply
  (JNIEnv *, jobject, jint a, jint b) {
    return a * b;
}

/*JNIEXPORT jdouble JNICALL Java_jnidemojava_Main_00024JNIFunction_nativeIntegrate
  (JNIEnv *, jobject, jdouble ja, jdouble jb, jdouble jc0,
                                              jdouble jc1,
                                              jdouble jc2,
                                              jdouble jc3,
                                              jdouble jc4,
                                              jdouble jc5,
                                              jdouble jc6,
                                              jdouble jc7) {*/
JNIEXPORT jdouble JNICALL Java_jnidemojava_Main_00024JNIFunction_nativeIntegrate
  (JNIEnv *env, jobject obj,
                jdouble ja,
                jdouble jb,
                jdoubleArray jC,
                jdoubleArray jXY) {
    double a = ja;
    double b = jb;
    double eps = 0.001;
    
    double s1, s;
    int n = 1; // steps number
    
    ///////// java format -> c/c++ format
    
    C = env->GetDoubleArrayElements(jC, JNI_FALSE);
    double *XY = env->GetDoubleArrayElements(jXY, JNI_FALSE);
    
    
    ///////////////////////////////////////////////////////
    
    s1 = simpson_integral(f, a, b, n); // first approximation
    do {
        s = s1;     // second approx
        n = 2 * n;  // increase number of steps two times
        s1 = simpson_integral(f, a, b, n);
    }
    while (fabs(s1 - s) > eps);  // to make proper accuracy eps

    ja = s1;
    
    ///////////////////////////////////////////////////////
    
    jsize SIZE = env->GetArrayLength(jXY);
    const double h = (b - a) / SIZE;
    s = 0;
    for (int i = 0; i < SIZE; i++) {
        XY[i] = f(s);
        s += h;
    }
    
    ///////// c/c++ format -> java format
    
    //env->SetDoubleArrayRegion(RESULT, 0, size, C);
    
    ///////// clear (release) the space allocated for c/c++ array C
    
    env->ReleaseDoubleArrayElements(jC, C, 0);
    env->ReleaseDoubleArrayElements(jXY, XY, 0);
    
    ///////////////////////////////////////////////////////
    
    return ja;
    
    //return RESULT;
}