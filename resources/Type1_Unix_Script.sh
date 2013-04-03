#! /bin/sh
# Copyright 2011 Quest Software, Inc.
# ALL RIGHTS RESERVED.
# 
# This software is the confidential and proprietary information of
# Quest Software Inc. ("Confidential Information").  You shall not
# disclose such Confidential Information and shall use it only in
# accordance with the terms of the license agreement you entered
# into with Quest Software Inc.
# 
# QUEST SOFTWARE INC. MAKES NO REPRESENTATIONS OR WARRANTIES ABOUT
# THE SUITABILITY OF THE SOFTWARE, EITHER EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR
# NON-INFRINGEMENT. QUEST SOFTWARE SHALL NOT BE LIABLE FOR ANY
# DAMAGES SUFFERED BY LICENSEE AS A RESULT OF USING, MODIFYING
# OR DISTRIBUTING THIS SOFTWARE OR ITS DERIVATIVES.


if [ $OSTYPE != "linux" ]; then
	exit 1
fi

if [ -z $sample_freq ]; then
	sample_freq=60
fi

echo LOG Start collecting data for Unix at $sample_freq seconds

echo TABLE Unix

echo START_SAMPLE_PERIOD
echo FooId.String.id = Bar
echo stringProp.String = This is a non-identity string property.
echo intProp.Integer = 30
echo countMetric = 40
echo timeMetric:second = 50
echo rateMetric:count/second = 50
echo fancyMetric:[4 kilobyte] = 50
echo intWithUnit.Integer:[minute] = 60
echo stringObs.StringObservation.obs = Hello World
echo END_SAMPLE_PERIOD

echo START_SAMPLE_PERIOD
echo FooId.String.id = Another Bar
echo stringProp.String = This is a non-identity string property.
echo intProp.Integer = 31
echo countMetric = 41
echo timeMetric:second = 51
echo rateMetric:count/second = 51
echo fancyMetric:[4 kilobyte] = 51
echo intWithUnit.Integer:minute = 61
echo stringObs.StringObservation.obs = abc
echo END_SAMPLE_PERIOD

echo END_TABLE


echo TABLE Processes

echo START_SAMPLE_PERIOD
echo Processes.String.id = `whoami`
echo KernelVer.String = `uname -r`
WHO=`whoami`
echo countMetric = `ps -ef| grep $WHO | wc -l`
echo END_SAMPLE_PERIOD

echo END_TABLE
