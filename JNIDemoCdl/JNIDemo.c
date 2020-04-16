/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include <jni.h>
#include <stdio.h>
#include "JNIDemoJava.h"

JNIEXPORT void JNICALL Java_jnidemojava_Main_nativePrint
        (JNIEnv *env, jobject obj) {
    printf("\nHello World from C\n");
}