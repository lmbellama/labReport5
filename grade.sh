CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission 2> uneccessary.txt
echo 'Finished cloning'

file=`find student-submission -iname "ListExamples.java"`

if ! [[ -f $file ]]
then
 echo "File does not exist"
else
 javac -cp ";../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar" *.java > result.txt
    if [[ $? -ne 0 ]]
    then
    echo "There was an error compiling your file" 
    else
    java -cp ";../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar" org.junit.runner.JUnitCore TestListExamples > result.txt
    echo `grep -h "OK" *.txt`

    echo `grep -h "Tests" *.txt`
    fi
fi



# Draw a picture/take notes on the directory structure that's set up after
# getting to this point


# Then, add here code to compile and run, and do any post-processing of the
# tests
