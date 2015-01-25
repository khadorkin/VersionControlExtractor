#!/bin/bash          

### Main File Location
##		Will have to loop through all of this
#inputLoc=testGit/sm_Tinfoil-Facebook/


appName=danTest
inputLoc=testGit/$appName/

### File to Search For
searchFile=AndroidManifest.xml

# Script location
MainScriptLoc=`pwd`

### FIX THIS - Make it automatic
#scriptPath=/Users/dxkvse/Desktop/VersionControlExtractor/

# main output location
mainOutput=$MainScriptLoc/mainOutput/

db=$MainScriptLoc/db/AndrosecDatabase.sqlite

rm -rf $mainOutput
mkdir -p $mainOutput


### Output Location
#mkdir -p Output




### Logging
#date1=$(date +"%s") ## Start date of the script
#logLocation=logs/toolsScript.log
#touch $logLocation
#echo "Start Getting Signing Key:" `date` >> $logLocation
#### Log the conclusion time
#date2=$(date +"%s") 
#diff=$(($date2-$date1))
#echo "toolsScript Total Running Time $(($diff / 60)) minutes and $(($diff % 60)) seconds."  >> $logLocation
#echo "toolsScript End:" `date` >> $logLocation




### Database namew & location where information will be written to
# 

#############################################
##### Functions

### Determine how many words are in a string
howManyWordsInString() { echo $#; }



### Get information about a specific commit
getCommitInfo() {

	git checkout $2 .
	mkdir -p $mainOutput/$1/$2

	## Move the ManifestFile to another location
	cp AndroidManifest.xml $mainOutput/$1/$2	
}






############################################# 





### Add the Info to SQLiteDB

		### Add the appName

#sqlite3 $db "UPDATE ToolResults SET DefectCount=$defectCount WHERE ApkId=$rowid;"
sqlite3 $db "select * from appdata;"

		### Get the AppID




	## Do  for every folder in the input directory
	### put the for loop here

		# Find the file location
		FileLoc=`find $inputLoc -name AndroidManifest.xml`

		# Log all versions of the file
		cd $(dirname $FileLoc)



		## Remove temp file if it exists
		##	Done here to leave it from troubleshooting after run
		rm -f temp2.txt

		#ManifestCommit=`git log --follow AndroidManifest.xml` 
			#echo $ManifestCommit



		### A file and not variable is used since it is easier to parse
		git log --follow AndroidManifest.xml>>temp2.txt



		COUNTER=0

		# Read through the filename
		while read p; do



		 	### Get the commit hashes
			if [ "${p/commit}" != "$p" ] ; then
				p=${p//commit/""}
		    		### Ensure that only the commit_hash are added to array, not comments
		    		###	
					wordcount=`howManyWordsInString $p`
					if [ "$wordcount" -eq 1 ] ; then


						#echo $(dirname $FileLoc)

						## Add the Commit Info to SQLite


						getCommitInfo $appName $p #$(dirname $FileLoc)
						#commitArray+=($p)
					fi
			fi 

		done <temp2.txt





### Loop through the contents of the commit messages array
#COUNTER=0
#for item in "${commitArray[@]}"
#	do
		# Leave in for debugging
 #   	let COUNTER=COUNTER+1
    	#echo "$COUNTER $item"

    	## Cherry pick each commit
    	#git cherry-pick $item



#done


# Revert back to the main script location
cd $MainScriptLoc




## Parse out all commit values and store in local array
#echo $ManifestCommit
#IN="bla@some.com;john@home.com"

#arr=$(echo $ManifestCommit | tr "commit" "\n")

#for x in $arr
#do
#    echo "> [$x]"
#done






#### Todo
# Logging
# Author, Date, Commit message



