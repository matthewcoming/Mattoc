aws.amazon.com/architecture/well-architected

## Five Pillars of a architecture:
1. Operational excellence
2. Security
3. Reliability
4. Performance Efficiency
5. Cost Optimization


### Operational excellence
1. Perform operations as code: treat your entire infrastructure the same as you would application code. scripted events, etc.
2. Annotate documentation: seek to automate documentation update process with change in environment.
3. Make frequent, small, reversible changes. Make changes in small increments that can be reversed if they fail without hurting the customer
4. Refine operations procedures frequently
5. anticipate failure. research potential sources of failure. test failure response and prevention
6. Learn from all operations failures

### Security
1. Implement a strong identity foundation. Stick to the principle of least privilege and enforce the separation of duties. Use appropriate authorization for each interaction with aws resource. centralize privilege management and reduce reliance on long term credentials
2. Enable traceability. Monitor, alert, and audit actions and changes to your environment in real time. integrate logs and metrics to systems to automatically respond and tale action.
3. Apply security at all layers. Don't focus on protected the outer layer, edge network, vpc, subnet, load-balancing
4. Automate security best practices. securely scale cost effectively with automation. secure architecture, defined and managed as code.
5. Protect data in transit and at rest. classify data into sensitivity levels with tokens and encryption where appropriate. reduce direct human access to data to reduce risk of loss or changes.
6. Prepare for security events.

### Reliability

1. Test recovery procedures. in the cloud, test how the system fails, see the scenarios where the cloud fails, and then test your own responses to those events.
2. Automatically recover from failure. Monitor system for performance indicators, you can alert when a threshold is met. this allows for automatic tracking of failures, and recovery.
3. Scale horizontally to increase aggregate system availability. replace a large resource with many smaller ones. in the case of failure, a small piece can be replaced. avoid overlapping points of failure.
4. Stop guessing capacity. a common cause of failure is resource saturation, when the demands placed on that system exceed the capacity of that system, DOS attacks. automate creation and removal of resources to respond to changes in demands.
5. Manage change in Automation. changes to your infrastructure. the changes that need to be managed are the configurations of those automations themselves.

### Performance Efficiency

1. Democratize advanced technologies. complex technologies require knowledge that is not evenly dispersed across the technical community. in the cloud, these technologies can become services that your team can consume rather than allocating resources to creating and managing these technologies.
2. Go global in minutes. deploy your system around the world to reduce latency.
3. Use serverless architectures. serverless architecture remove the need for your to run and maintain servers. storage services can act as static websites. event services can host your code for you. lowers transactional cost.
4. Experiment more often. with virtual and automatable resources, you can quickly carry out comparative testing using different types of instances, storage, or configurations.
5. Mechanical sympathy. use the technology approach that aligns best with what you are trying to achieve. consider data success patterns when selecting database or storage approaches.

### Cost Optimization

1. Adopt a consumption model. Pay only for the computing resources that you consume, and increase or decrease usage depending on busines requirements, not by using forcasting. for example, development environments are only used for 8 hours a day during the work week, you can elect to not use the resources when  they are not in use.
2. Measure overall efficiency. Measure the business output of the systems and the cost associated with delivering it. Use this meadure to understand the gains you make from increasing output and reducing costs.
3. Stop spending money on data center operations. aws does the heavy lifting of racking, stacking, and powering servers so you can focus on your customers and projects, rather than on IT infrastructure.
4. Analyze and attribute expenditure. The cloud makes it easier to identify the cost of systems, which then allows attribtion of IT costs to the various business owners. this helps mesasure return on investment and gives system owners an opportunity to optimize their resources and reduce costs.
5. Use managed services to reduce cost of ownership. in the cloud, managed services remove the operational burden of managing servers for tasks like managing email or maintaining databases. and because managed services operate at cloud scale, they can offer a lower cost per transaction or service.

## Fault Tolerance and high Availability

### Fault Tolerance
* Remain operational even if components fail
* Built in redundancy of appliccation components.

### High Availability
* "Always" funcitoning and accessible
* Downtime is minimized
* Without human intervention

## High Availability Service Tools

* Elastic load balancers
* Elastic IP addresses
* Amazon Route 53
* Auto sclaing
* Amazon CloudWatch

### Elastic load Balancers or ELB's

* distributes incoming traffic or loads amongst your instances. ELB can also send metrics to Amazon CloudWatch.
* Can be a trigger and notify you of high latency or if servers are being overutilised. They can be Customised to recognixed unhealthy metrics on your instance, it can be public or internal facing, and it can use multiple different protocols.

### Elastic IP Addresses

* useful in providing fault tolerance.
* A static Ip address that allows you to mask a failure of a component. Users will continue to use the same IP address with different resources.
* application is still available to users even if it fails.

### Amazon Route 53

* Authoritative DNS servic
* translate domain names into IP addresses.
* High availability in mind


### Auto Scaling

* launches and terminates on specified conditions
* Can be adjusted and modified depending on changes in customer demand
* avoid limitations of creating new resources.
* scale up or down

### Amazon CloudWatch

* distribute statistics gathering system
* ability to create and use your own custom metrics
* alerts, and changes architecture depending on these metrics

## Fault Tolerance Tools

* Amazon simple queue service SQS
* Amazon simple storage servie S3
* Amazon simple DB
* Amazon relational database service

## Web Hosting

* Amazon VPC
* Amazon Route 53
* Amazon Cloudfront
* Amazon load balancing
* Firewall/AWS Sheild
* Auto Scaling
* App servers/EC2 instances
* Amazon ElastiCache
* Amazin RDS/Amazon DynamoDB

### Key architectural Condsiderations
* No more physical network appliances. you can no longer have firewalls and load balancers on physical devices, but must all be written in code.
* Firewalls everywhere
* Consider availability of data, using multiple data centers.
* Your web Host should be considered ephemeral and dynamic.
