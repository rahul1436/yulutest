node{
    stage('scm checkout'){
        git credentialsId: '85acc76b-f811-4ceb-9f29-13922d44bcaa', url: 'https://github.com/rahul1436/yulutest.git'
    }

    stage('mvn clean install'){
        def mvnHome= tool name: 'maven', type: 'maven'
	def mvnCMD = "${mvnHome}/bin/mvn"
	sh "${mvnCMD} clean package"

    }
    sh label: '', script: 'cp /var/lib/jenkins/workspace/yulu-assignment-2/target/MavenWebApp.war /var/lib/jenkins/workspace/yulu-assignment-2'
    stage ('transfer file'){
        sh label: '', script: '''id=$(aws autoscaling describe-auto-scaling-instances --region ap-south-1 --query AutoScalingInstances[].InstanceId --output text)
ip=$(aws ec2 describe-instances --instance-ids $id --query \'Reservations[*].Instances[*].PublicIpAddress\' --output text)
echo $ip > machine.txt
ssh -oStrictHostKeyChecking=no -i ~/yulu.pem ubuntu@$ip
scp -i /var/lib/jenkins/yulu.pem Dockerfile ubuntu@$ip:/home/ubuntu
scp -i /var/lib/jenkins/yulu.pem MavenWebApp.war ubuntu@$ip:/home/ubuntu'''
}
stage ('deploy file'){
    sh label: '', script: '''filename="machine.txt"
	while read -r line; do
	ssh -oStrictHostKeyChecking=no -i ~/Downloads/yulu.pem ubuntu@$line sh 1.sh
 	done < "$filename"
'''
    
}
    
    
}
