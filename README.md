# Spring-Security-4
Spring Security framwork is a powerful and highly customizable authentication and authorization framkework
In this post, I will show you **how to integrate Spring MVC application with Spring Security Framework** for securing the URLs access with authentication for Java EE base applications.

* Tools and technologies used for this application are-
  * Spring Security 4.2.3.RELEASE
  * Spring MVC 4.3.10.RELEASE
  * Java SE 1.8
  * Maven 3.5.1
  * Eclipse Neon.3
  * Apache Tomcat 7.0(Embeded)
  
## Step1 - Create maven project
Create a maven project for our Spring MVC + Spring Security application in Eclipse IDE.

1. Go to **New** menu -> **Other** -> **Maven** -> **Maven Project** and click on **Next**.

![Alt text](https://user-images.githubusercontent.com/18185890/33056423-f4207ea0-cec8-11e7-87d6-3eb2b72f7730.png)

2. In **New Maven Project** wizard, select **Create a simple project** and click on **Next**.

![Alt text](https://user-images.githubusercontent.com/18185890/33056416-f2d92a56-cec8-11e7-9b53-f5b9d2d1e11e.png)

3. In next wizard, add project information as shown below and click on **Finish**.
For your information, please click this link to learn more about [Maven naming conventions on groupid artifactId and version](https://maven.apache.org/guides/mini/guide-naming-conventions.html)

![Alt text](https://user-images.githubusercontent.com/18185890/33056417-f3012bdc-cec8-11e7-831a-4b208a26c290.png)

4. Open **pom.xml** file and add servlet dependency and Tomcat maven plugin in it as shown below.
~~~
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.boraji.tutorial.spring</groupId>
  <artifactId>maven-web-project-example</artifactId>
  <version>0.0.1-SNAPSHOT</version>
  <packaging>war</packaging>
  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <failOnMissingWebXml>false</failOnMissingWebXml>
  </properties>

  <dependencies>
    <!-- Servlet API -->
    <dependency>
      <groupId>javax.servlet</groupId>
      <artifactId>javax.servlet-api</artifactId>
      <version>3.1.0</version>
      <scope>provided</scope>
    </dependency>
  </dependencies>

  <build>
    <sourceDirectory>src/main/java</sourceDirectory>
    <plugins>
      <plugin>
        <artifactId>maven-compiler-plugin</artifactId>
        <version>3.5.1</version>
        <configuration>
          <source>1.8</source>
          <target>1.8</target>
        </configuration>
      </plugin>

      <!-- Embedded Apache Tomcat required for testing war -->

      <plugin>
        <groupId>org.apache.tomcat.maven</groupId>
        <artifactId>tomcat7-maven-plugin</artifactId>
        <version>2.2</version>
        <configuration>
          <port>8181</port>
          <path>/</path>
        </configuration>
      </plugin>
    </plugins>
  </build>
</project>
~~~

After changes in **pom.xml**, update the maven web project.
To update web maven project, right click on **maven-web-project-example** project -> **maven** -> **Update Project**.

5. Review the maven web project structure.

![Alt text](https://user-images.githubusercontent.com/18185890/33056418-f33f0088-cec8-11e7-8e8e-1c2708d98a56.png)

6. Build the project using the following maven command.

**mvn clean install**

To execute the about maven command in Eclipse IDE, go to **Run** menu -> **Run Configuration..** to create a new configuration.

In **Run Configuration** Wizard, double click on **Maven Build** and provide the configuration information (Name, Base Directory and Goals) as shown in the below image.

![Alt text](https://user-images.githubusercontent.com/18185890/33056419-f365f80a-cec8-11e7-8871-de8a6cf641a2.png)

Now click on the *Config* and monitor the output in console.

![Alt text](https://user-images.githubusercontent.com/18185890/33056420-f38cac7a-cec8-11e7-8d45-c63f8ec18c2d.png)

7. Run embedded tomcat server using the following command.

**mvc tomcat7:run**

To execute the about maven command in Eclipse IDE, create a new configuration as shown in the below image.

![Alt text](https://user-images.githubusercontent.com/18185890/33056421-f3d49f08-cec8-11e7-98c8-4f22a0afd439.png)
