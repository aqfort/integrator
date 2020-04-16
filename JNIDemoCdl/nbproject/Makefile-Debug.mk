#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux
CND_DLIB_EXT=so
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/JNIDemo.o \
	${OBJECTDIR}/JNIDemoCPP.o


# C Compiler Flags
CFLAGS=-shared

# CC Compiler Flags
CCFLAGS=-shared -fopenmp
CXXFLAGS=-shared -fopenmp

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk dist/libJNIDemoCdl.so

dist/libJNIDemoCdl.so: ${OBJECTFILES}
	${MKDIR} -p dist
	${LINK.cc} -o dist/libJNIDemoCdl.so ${OBJECTFILES} ${LDLIBSOPTIONS} -shared -fPIC

${OBJECTDIR}/JNIDemo.o: JNIDemo.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -g -I/usr/lib/jvm/java-8-oracle/include -I/usr/lib/jvm/java-8-oracle/include/linux -include /usr/lib/jvm/java-8-oracle/include/classfile_constants.h -include /usr/lib/jvm/java-8-oracle/include/jawt.h -include /usr/lib/jvm/java-8-oracle/include/jdwpTransport.h -include /usr/lib/jvm/java-8-oracle/include/jni.h -include /usr/lib/jvm/java-8-oracle/include/jvmti.h -include /usr/lib/jvm/java-8-oracle/include/jvmticmlr.h -include /usr/lib/jvm/java-8-oracle/include/linux/jawt_md.h -include /usr/lib/jvm/java-8-oracle/include/linux/jni_md.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/JNIDemo.o JNIDemo.c

${OBJECTDIR}/JNIDemoCPP.o: JNIDemoCPP.cpp
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -I/usr/lib/jvm/java-8-oracle/include -I/usr/lib/jvm/java-8-oracle/include/linux -include /usr/lib/jvm/java-8-oracle/include/linux/jawt_md.h -include /usr/lib/jvm/java-8-oracle/include/linux/jni_md.h -include /usr/lib/jvm/java-8-oracle/include/classfile_constants.h -include /usr/lib/jvm/java-8-oracle/include/jawt.h -include /usr/lib/jvm/java-8-oracle/include/jdwpTransport.h -include /usr/lib/jvm/java-8-oracle/include/jni.h -include /usr/lib/jvm/java-8-oracle/include/jvmti.h -include /usr/lib/jvm/java-8-oracle/include/jvmticmlr.h -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/JNIDemoCPP.o JNIDemoCPP.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
