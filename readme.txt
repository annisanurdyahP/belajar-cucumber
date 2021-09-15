How to run automation

${CURDIR} based on your path

API
--> robot ${CURDIR}/data-factory/post-data.robot
--> robot ${CURDIR}/data-factory/date-test.robot

Mobile
--> run for spesific test case
    robot -i test_case=C05 ${CURDIR}/data-factory/mobile.robot
--> run all test case
    robot ${CURDIR}/data-factory/mobile.robot