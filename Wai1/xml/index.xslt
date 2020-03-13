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
				<link rel="stylesheet" href="index.css" />
			</head>
			<body>
				<div id="wrapper">
					<header>
						<h1>Style Piwa</h1>
					</header>
            
					<div id="content">
            <h2>Piwa ponizej 8%</h2>
						<xsl:call-template name="listl"/>
            <h2>Piwa Powyzej 8%</h2>
            <xsl:call-template name="listg"/>
						<h2 >Ale</h2>
              <xsl:apply-templates  select="main/content/styl[@kind='Ale']"/>
					  <h2>Lagery</h2>
              <xsl:apply-templates select="main/content/styl[@kind='Lager']"/>
            
						<h2 id="links">Pomocne linki</h2>
            <xsl:apply-templates select="main/content/informations/links"/>
						
            
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

  <xsl:template match="links">
       <xsl:apply-templates select="link"/>
  </xsl:template>

  <xsl:template match ="link">
    <a>
      <xsl:attribute name="href">
        <xsl:value-of select="@source"/>
      </xsl:attribute>
      <xsl:value-of select="."/>
    </a>
    <br/>
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

  <xsl:template match= "main/content/styl[@kind='Lager']">
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

  <xsl:template match ="text">
    <p>
    <xsl:attribute name="class">
      <xsl:value-of select="@class"/>
    </xsl:attribute>
    <xsl:value-of select="."/>
      </p>
  </xsl:template>
  
  
  <xsl:template match="media/img">
    <img>
      <xsl:attribute name="src">
        <xsl:value-of select="@source"/>
      </xsl:attribute>
      <xsl:attribute name="class">
        <xsl:value-of select="@class"/>
      </xsl:attribute>
      <xsl:attribute name="title">
        <xsl:value-of select="@hover"/>
      </xsl:attribute>
    </img>
  </xsl:template>
  
  <xsl:template name="listl">
    <ul>
    <xsl:for-each select="main/content/list/element">
      <xsl:sort select="procent" order='ascending'/>
      <xsl:if test="(procent &lt; 0.08)">
        <li>
      <xsl:call-template name="el"/>
        </li>
      </xsl:if>
    </xsl:for-each>
     </ul>
  </xsl:template>
  
  <xsl:template name="el">
   
        <xsl:variable name ="pro">
          <xsl:value-of select="procent"/>
        </xsl:variable>
        <xsl:value-of select="number(position())"/>
      <xsl:text>. </xsl:text>
      <xsl:value-of select="name"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select='format-number($pro, "#.0%")' />
    
  </xsl:template>
  
  <xsl:template name='listg'>
    <ul>
      <xsl:for-each select="main/content/list/element">
        <xsl:sort select="procent" order='descending'/>
        <xsl:if test="(procent &gt; 0.08)">
          <li>
            <xsl:call-template name="el"/>
          </li>
        </xsl:if>
      </xsl:for-each>
    </ul>
    </xsl:template>
</xsl:stylesheet>
