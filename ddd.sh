#!/bin/bash
commitStr=`cat test.txt | grep ":commit =>"`
echo -e "here1--${commitStr}"

if [[ ! $commitStr ]]; then
	echo here2
	source=`cat test.txt | grep "s.source"`
	source=${source#*https:}
	source=${source%% \}}
	echo ${source}
	sed -i.bak "s:${source}:${source} \:commit => 1223:g" test.txt
	rm test.txt.bak
else
	echo here3
	sed -i.bak "s:\(commit =>\).*:\1 xxxx \}:g" test.txt
	rm test.txt.bak
fi