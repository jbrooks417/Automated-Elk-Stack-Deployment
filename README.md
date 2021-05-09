# Automated Elk-stack Deployment
Jeremy Brooks 05/90/2021

<p>The files in this repository were used to configure the network depicted below.</p>

<a href="https://github.com/jbrooks417/Elk-stack-/blob/main/Diagrams/Capture4.PNG"> RedTeam Network Diagram</a>

<p>These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Red-Team Network Diagram file may be used to install only certain pieces of it, such as Filebeat.</p>

<a href="https://github.com/jbrooks417/Elk-stack-/blob/main/Ansible/filebeat-config.yml"> Filebeat-config.yml</a>

<a href="https://github.com/jbrooks417/Elk-stack-/blob/main/Ansible/filebeat-playbook%20.yml"> Filebeat-playbook.yml</a>

<a href="https://github.com/jbrooks417/Elk-stack-/blob/main/Ansible/install-elk.yml"> Install-elk.yml</a>

<a href="https://github.com/jbrooks417/Elk-stack-/blob/main/Ansible/metricbeat-configuration.yml"> Metricbeat-config.yml</a>

<a href="https://github.com/jbrooks417/Elk-stack-/blob/main/Ansible/metricbeat-playbook.yml"> Metricbeat-playbook.yml</a>

<a href="https://github.com/jbrooks417/Elk-stack-/blob/main/Ansible/pentest.yml"> Pentest.yml</a> 

<p>*This document contains the following details:</p>
<ul>
  
  <p><li>Description of the Topology</li></p>
  
  <p><li>Access Policies</li></p>
  
  <p><li>ELK Configuration</li></p>
  
  <p><ul><li>Beats in Use</li></p>
  
  <li>Machines being moniotored</li></ul>
    
<p><li>How to Use the Ansible Build</li></p>
</ul>  
<p><h2>Description of The Topology</h2></p>
<p>The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.</p>
<ul>
<p><li>Load balancing ensures that the application will be highly functional, in additon to restricting high traffic to the network.</li></p>
 
<p><li>What aspect of security do load balancers protect?</li></p>

<p><ul><li>It helps prevent overloading servers as well as optimizes productivity and maximizes uptime.</li></ul></p>

<p><ul><li>Additonal it adds resiliency by rerouting live traffic from one server to another causing it to eliminate single points of failure from attacks such as DDoS attack.
</li></ul></p>

<li>What is the advantage of a jump box?</li>

 <p><ul><li>Jump-box are highly secured computers that are never used for non-admin tasks. Throughout the years, jump-box has improved into an even more comprehensive/lock-down secure admin workstation to decrease the chances of hackers/malware infection.</li></ul></p>

<p><li>Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the _____ and system _____.</li></p>

<p><li>What does Filebeat watch for?</li></p>

<p><ul><li>It monitors ther log files/ locations that you specify and forwards them to Elastasearch and Logstash for indexing</li></ul></p>

<p><li>What does Metricbeat record?</li></p>
<p><ul><li>It records metrics/statistics data and transports them to the output that you specifics thru Elasticsearch/Logstash.</li></ul></p>
<br></br>
<p>The configuration details of each machine may be found below.</p>

<table style="width:100%">
  <tr>
    <th>Name</th>
    <th>Function</th>
    <th>IP Address</th>
    <th>Operating System</th>
  </tr>
   <tr>
     <td>Jump-Box-Provisoner</td>
     <td>GateWay</td>
     <td>10.0.0.4</td>
     <td>Linux</td>
  </tr>  
   <tr>
     <td>Elk-Machine</td>
     <td>Server</td>
     <td>10.1.0.4</td>
     <td>Linux</td>
  </tr>
   <tr>
     <td>Web1</td>
     <td>Server</td>
     <td>10.0.0.8</td>
     <td>Linux</td>
  </tr>
   <tr>
     <td>Web2</td>
     <td>Server</td>
     <td>10.0.0.9</td>
     <td>Linux</td>
  </tr>
  <tr>
     <td>Web3</td>
     <td>Server</td>
     <td>10.0.0.10</td>
     <td>Linux</td>
  </tr>
</table>  


<br></br>

<h2>Access Policies</h2>
<p>The machines on the internal network are not exposed to the public Internet.</p>

<p>Only the jump-Box-Provisioner machine can accept connections from the Internet.
Access to this machine is only allowed from the following IP addresses:</p>
<p><li>73.163.170.96 (LocalHost IP address)</li></p>
<p>Machines within the network can only be accessed by Jump-Box-Provisioner</p>

<p>Which machine did you allow to access your ELK VM?</p>

<p><li>Jump-Box-Provisioner</li></p>

<p>What was its IP address?</p>

<p><li>10.1.0.4 (Private)</li></p>
<p>A summary of the access policies in place can be found in the table below.</p>
   
 <table style="width:100%">
  <tr>
    <th>Name</th>
    <th>Publicly Accessible</th>
    <th>Allowed IP Address</th>
    
  </tr>
   <tr>
     <td>Jump-Box-Provisoner</td>
     <td>Yes</td>
     <td>73.163.170.96</td>
  </tr>  
   <tr>
     <td>Elk-Machine</td>
     <td>No</td>
     <td>10.0.0.4</td>
  </tr>
   <tr>
     <td>Web1</td>
     <td>No</td>
     <td>10.0.0.4</td>
  </tr>
   <tr>
     <td>Web2</td>
     <td>No</td>
     <td>10.0.0.4</td>
  </tr>
  <tr>
     <td>Web3</td>
     <td>No</td>
     <td>10.0.0.4</td>
  </tr>
</table>     
<p><li>All these VMs can only be acessed from the Jump-Box-Provisoner</li></p>

<h2>Elk Configuartion</h2>
<p>Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...</p>

<p>What is the main advantage of automating configuration with Ansible?</p>

<p><li>One main advantage would be YAML Playbooks. It is the best alternative for configuration management/automation.</li></p>
<p><li>It is also able to automate complex multi-tier IT application environemtns.</li></p>
*The playbook implements the following tasks:

<p>In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc.</p>

<p><li>First I SSH into the Jump-Box-Provisioner (ssh azadmin@20.69.121.183)</li></p>
<p><li>Start/Attached to the ansible docker (sudo docker start trusting_lichterman)/(sudo docker attach trusting_lichterman)</li></p>
<p><li>Went to /etc/ansible directory and created the ELK playbook (install-elk.yml)</li></p>
<p><li>Ran the Elk_Playbook.yml in that same directory (ansible-playbook install-elk.yml)</li></p>
<p><li>Lastly, I SSH into the ELK-VM to verify the server is up and running.</li></p>
<p>The following screenshot displays the result of running docker ps after successfully configuring the ELK instance.</p>
<a href="https://github.com/jbrooks417/Elk-stack-/blob/main/Linux/Capture5.PNG"> Elk-Install</a>
<br></br>
<h2>Target Machines & Beats</h2>
*This ELK server is configured to monitor the following machines:

List the IP addresses of the machines you are monitoring

<p><li>Web-1 (10.0.0.8)</li></p>
<p><li>Web-2 (10.0.0.9)</li></p>
<p><li>Web-3 (10.0.0.10)</li></p>

<p>We have installed the following Beats on these machines:</p>

<a href="https://github.com/jbrooks417/Elk-stack-/blob/main/Linux/Capture6.PNG"> Filebeat-playbook</a>

<a href="https://github.com/jbrooks417/Elk-stack-/blob/main/Linux/Capture7.PNG"> Metricbeat-playbook</a>

<p>These Beats allow us to collect the following information from each machine:</p>

<p>In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see.</p>

Filebeat is used to collect log files from specific files on remote machines.

Examples of Filebeats can be files that are generated by Apache, Microsoft Azure tools, the Nginx web server, and MySQl databases.

Metricbeat collects machine metrics.

It is simply a measurement to tell analysts how healthy it is.

Examples of Metricbeat can be CPU usage/Uptime
