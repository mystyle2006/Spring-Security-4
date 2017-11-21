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

## Step2 - Change jar dependencies
To integrate the Spring security in Spring MVC application, we need to add the **spring-security-web**, **spring-security--config** and **spring-security-taglibs** jar dependencies in our **pom.xml** file.

Open **pom.xml** file and write the following code in it.

~~~
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.java.tutorial.spring</groupId>
  <artifactId>maven-web-project-example</artifactId>
  <version>0.0.1-SNAPSHOT</version>
  <packaging>war</packaging>
  
  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <failOnMissingWebXml>false</failOnMissingWebXml>
  </properties>
  
   <dependencies>
   	<!-- Spring MVC Dependency -->
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-webmvc</artifactId>
      <version>4.3.10.RELEASE</version>
    </dependency>
    <!-- Spring Security Dependency -->
    <dependency>
      <groupId>org.springframework.security</groupId>
      <artifactId>spring-security-web</artifactId>
      <version>4.2.3.RELEASE</version>
    </dependency>
    <dependency>
      <groupId>org.springframework.security</groupId>
      <artifactId>spring-security-config</artifactId>
      <version>4.2.3.RELEASE</version>
    </dependency>
    <dependency>
      <groupId>org.springframework.security</groupId>
      <artifactId>spring-security-taglibs</artifactId>
      <version>4.2.3.RELEASE</version>
    </dependency>
    <!-- Servlet API -->
    <dependency>
      <groupId>javax.servlet</groupId>
      <artifactId>javax.servlet-api</artifactId>
      <version>3.1.0</version>
      <scope>provided</scope>
    </dependency>
    <!-- JSP Dependency -->
    <dependency>
      <groupId>javax.servlet.jsp</groupId>
      <artifactId>javax.servlet.jsp-api</artifactId>
      <version>2.3.1</version>
      <scope>provided</scope>
    </dependency>
    <!-- JSTL Dependency-->
    <dependency>
      <groupId>javax.servlet</groupId>
      <artifactId>jstl</artifactId>
      <version>1.2</version>
    </dependency>
    <dependency>
		<groupId>taglibs</groupId>
		<artifactId>standard</artifactId>
		<version>1.1.2</version>
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

## Step3 - Create controller class
Create a simple **@Controller** class inside **con.java.tutorial.controller** package as follows.

**UserController.java**

~~~
package com.java.tutorial.controller;

import java.security.Principal;

import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	@GetMapping("/")
	public String index(){
		return "index";
	}
	
	@GetMapping("/user")
	public String user(Principal principal){
		System.out.println(principal.getName());
		return "user";
	}
	
	@GetMapping("/admin")
	public String admin(){
		SecurityContext context = SecurityContextHolder.getContext();
		System.out.println(context.getAuthentication().getName());
		
		return "admin";
	}
	
	@GetMapping("/login")
	public String login(){
		return "login";
	}
}
~~~

## Step4 - Create JSP views
Create **login.jsp**, **index.jsp**, **user.jsp** and **admin.jsp** files under **src\main\webapp\WEB-INF\views** folder.

**login.jsp**

~~~
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix ="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:url var="loginUrl" value="/login" />
<form action="${loginUrl}" method="POST">
	<c:if test="${param.error != null}">
		<p>Invalid username and password.</p>
	</c:if>
	<c:if test="${param.logout != null}">
		<p>You have been logged out successfully.</p>
	</c:if>
	ID : <input type="text" name="id" />
	PW : <input type="password" name="pw" />
	<input type="hidden" name="${_csrf.parameterName}"   value="${_csrf.token}" />
	<input type="submit" value="Submit" />
</form>
</body>
</html>
~~~

**index.jsp**

~~~
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
  prefix="security"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>Spring Security 4 - Hello World Example</h2>
	<hr />
	<h3>
		Welcome!
		<security:authorize access="isAnonymous()">
			Guest
		</security:authorize>
		<!-- Print the logged in user name -->
		<security:authorize access="isAuthenticated()">
			<security:authentication property="principal.username"/>
		</security:authorize>
		
	</h3>
	<security:authorize access="isAnonymous()">
		Login as <a href="user">User</a> or <a href="/admin">Admin</a>
	</security:authorize>
	<security:authorize access="isAuthenticated()">
		<security:authorize access="hasRole('USER')">
			<a href="user">My Profile</a>
		</security:authorize>
		<security:authorize access="hasRole('ADMIN')">
			<a href="admin">My Profile</a>
		</security:authorize>
		<a href="logout">Logout</a>
	</security:authorize>
</body>
</html>
~~~

**user.jsp**

~~~
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>Spring Security 4 - Hello World Example</h2>
	<hr />
	<h3>User dashboard  </h3>
	
	<security:authorize access="isAuthenticated()">
		<b>Welcome! <security:authentication property="principal.username" /></b>
	</security:authorize>
	
	<br />
	
	<security:authorize access="isAuthenticated()">
		<a href="/">Home</a> | <a href="logout">Logout</a>
	</security:authorize>
</body>
</html>
~~~

**admin.jsp**

~~~
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
  prefix="security"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>Spring Security 4 - Hello World Example</h2>
	<hr />
	
	<h3>Admin dashboard</h3>
	
	<security:authorize access="isAuthenticated()">
		<b>Welcome! <security:authentication property="principal.username" /></b>
	</security:authorize>
	
	<br />
	
	<security:authorize access="isAuthenticated()">
		<a href="/">Home</a> | <a href="logout">Logout</a>
	</security:authorize>
</body>
</html>
~~~

**<security:authorize />** tag evaluates the access expression, specified in the access attribute, to true for authenticate user. For your information, view [Common Built-In Expressions](https://docs.spring.io/spring-security/site/docs/current/reference/html/el-access.html#el-common-built-in) which can be used in **access** attribute of the **<security:authorize />** tag.

## Step 5 - Create spring security configuration class.
The first step is to create a **@Configuration** class by extending the **WebSecurityConfigurerAdapter** class as follows.

**WebSecurityConfig.java**

~~~
package com.java.tutorial.config;

import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication()
			.withUser("inho").password("123").roles("USER")
			.and()
			.withUser("admin").password("123").roles("ADMIN");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/").permitAll()
		.and()
		.authorizeRequests().antMatchers("/user**").hasRole("USER")
		.and()
		.authorizeRequests().antMatchers("/admin**").hasRole("ADMIN")
		.and()
		.formLogin()
			.loginPage("/login")
			.usernameParameter("id")
			.passwordParameter("pw")
		.and().csrf()
		.and()
		.logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"));
	}
}
~~~

This Java configuration class creates **a Servlet Filter known as the springSecurityFilterChain**, which is responsible for all security(protecting the application URLs, validating submitted username and passwords, redirecting to the log in form) within your application.

The overridden method **configure(AuthenticationManagerBuilder auth)** configure the in momory authentication with user credentials and roles. You can configure the other authetnications too such as JDBC, LDAP etc.

The overriden method **configure(HttpSecurity http)** configure the web based security for all HTTP request. By default it will be applied to all requests, but can be restricted using the **requestMatcher()** or other similar methods.

From the above configuration class, it is clear that -

* URL '/' is not secured and accessible by everyone.
* Any URLs that starts with **'/user'** are secured and only accessible by users who have the role **'USER'**.
* Any URLs that starts with **'/admin'** are secured and only accessible by users who have the role **'ADMIN'**.

## Step 6 - Register springSecurityFilterChain Filter
In java configuration, we can register the spring **sepringSecurityFilterChain** using the base class
**AbstractSecurityWebApplicationInitializer** as follows.

**SecurityWebApplicationInitializer.java**

~~~
package com.java.tutorial.config;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

// this configuration only registers the springsecurityfilterChain Filter for every URL in your application.
public class SecurityWebApplicationInitializer extends AbstractSecurityWebApplicationInitializer {
	
}
~~~

This configuration only registers the **springSecurityFilterChain** Filter for every URL in your application.

Here is the equialvent XML configuration for registering the spring **springSecurityFilterChain** -

~~~
<filter>
    <filter-name>springSecurityFilterChain</filter-name>
    <filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
</filter>
 
<filter-mapping>
    <filter-name>springSecurityFilterChain</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>
~~~

## Step 7 - Create spring web configuration class
Create a web **@Configuration** class annotated with **@EnableWebMvc** and **@ComponentScan** as follows.

**WebConfig.java**

~~~
package com.java.tutorial.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "com.java.tutorial.controller" })
public class WebConfig extends WebMvcConfigurerAdapter {
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry){
		registry.jsp().prefix("/WEB-INF/views/").suffix(".jsp");
	}
}
~~~

## Step 8 - Create application initializer class
Create a **MvcWebApplicationInitializer** class, which will replace our traditional **web.xml**, to initialize the Servlet container.

Load the **WebSecurityConfig** and **WebConfig** classes using the **getRootConfigClasses()** and **getServletConfigClasses()** methods as follows.

**MvcWebApplicationInitializer.java**

~~~
package com.java.tutorial.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class MvcWebApplicationInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
	@Override
	protected Class<?>[] getRootConfigClasses(){
		return new Class[] { WebSecurityConfig.class };
	}
	
	@Override
	protected Class<?>[] getServletConfigClasses(){
		return new Class[] { WebConfig.class };
	}
	
	@Override
	protected String[] getServletMappings(){
		return new String[] { "/" };
	}
}
~~~

## Step 9 - Review the final project structure.

