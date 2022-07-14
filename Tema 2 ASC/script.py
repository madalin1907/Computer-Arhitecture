from pwn import *

context.log_level = 'error'
context.timeout = 1
inputArray = [
    ["28 21 1 2 3 4 5 6 7 0 9 10 11 12 13 14 15 16 17 18 19 20 21 22 0 24 25 26 27 28 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 0 18 19 20 21 22 23 24 25 26 27 28 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 0 26 27 28",
     "15 6 0 2 3 0 0 0 7 8 0 10 11 12 13 14 15 1 2 3 4 5 6 7 0 9 10 11 12 13 14 15 1 2 3 4 5 6 7 8 9 10 11 12 0 14 0",
     "5 2 1 0 0 4 5 1 0 3 0 0 1 2 0 4 5",
     "20 14 1 2 3 0 5 6 7 8 0 10 11 12 13 14 15 16 17 18 19 20 0 2 3 0 5 6 7 8 9 10 11 12 13 14 0 16 17 0 19 20 0 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 0 19 20",
     "4 1 1 2 3 4 0 4 3 2 1 3 2 1",
     "5 2 0 2 4 3 2 0 4 1 5 2 3 5 1 4 5"]]
outputArray = [
    [
     "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28",
     "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15",
     "1 2 3 4 5 1 2 3 4 5 1 2 3 4 5",
     "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 1 19 20 18 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20",
     "-1",
     "-1"]]
executables = ["./143_Florea_MadalinAlexandru"]

estimatedGrade = 0

for taskIndex in range(len(executables)):
	findProcess = process(["find", executables[taskIndex]])
	findResult = findProcess.recv()
	findProcess.kill()
	
	if findResult.replace("\n", "").strip() != executables[taskIndex]:
		print "Executable %s not found!" % executables[taskIndex]
		continue 
		
	print "Task: %s" % executables[taskIndex]
		
	taskInputArray = inputArray[taskIndex]
	taskOutputArray = outputArray[taskIndex]
	taskPoints = [1]
	
	for i in range(0, len(taskInputArray)):
		try:
			sh = process(executables[taskIndex])
			sh.sendline(taskInputArray[i])
			line = sh.recvline().replace("\n", "").strip()
			sh.kill()
			
			if line == taskOutputArray[i]:
				estimatedGrade += taskPoints[0]
				
				if taskIndex < 3:
					print "\tTest %d: OK (%dp)" % (i, taskPoints[0]) 
			else:
				print "\tTest %d failed (0p)" % i 
				print "\t   Input: %s" % taskInputArray[i]
				print "\t   Your output: %s" % line 
				print "\t   Expected output: %s" % taskOutputArray[i]
			
		except:
			print "\tTest %d: exception! (0p)" % i
	print "\n"

print "Estimated grade %d / 565" % (estimatedGrade)
