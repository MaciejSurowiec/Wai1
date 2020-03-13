<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

	<xsl:template match="/">

		<html>
			<head>
				<meta charset="UTF-8" />
				<title>Style Piwa</title>
				<meta name="viewport" content="width=device-width, initial-scale=1.0" />
				<link rel="stylesheet" href="trans2.css" />
			</head>
			<body>
				<div id="wrapper">
					<header>
						<h1>Style Piwa</h1>
					</header>

					<div id="content">
            <h2 >Ale</h2>
            <xsl:apply-templates  select="main/content/styl[@kind='Ale']"/>
						
						
            
					</div>
					
				</div>
				
				<footer>
					<xsl:apply-templates select="main/author"/> 
				</footer>
			</body>
		</html>

	</xsl:template>

	<xsl:template match="author">
		Copyright 2019, <xsl:value-of select="name"/> 
	</xsl:template>

  <xsl:template match="main/content/styl[@kind='Ale']">
    <div>
      <xsl:attribute name="class">
        <xsl:value-of select="@class"/>
      </xsl:attribute>

      <xsl:apply-templates select="media/img"/>
      <xsl:apply-templates select="text"/>
    </div>
    <br/>
    <br/>
  </xsl:template>
  
  
  
  
  
 
</xsl:stylesheet>
