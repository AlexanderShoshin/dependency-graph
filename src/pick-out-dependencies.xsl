<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" />
	
	<xsl:template match="/packJSStructure">	
		<xsl:variable name="depSelection">
			<xsl:apply-templates select="module | file" />
		</xsl:variable>
		
		<xsl:variable name="normDepSelection">
			<xsl:value-of select="normalize-space($depSelection)" />
		</xsl:variable>

		"use strict";
		window.links = [
			<xsl:value-of select="substring($normDepSelection, 1, string-length($normDepSelection) - 1)" />
		]
	</xsl:template>
	
	<xsl:template match="packJSStructure/module | packJSStructure/file">
		<xsl:variable name="unitId" select="id" />
		<xsl:variable name="unitDepCount" select="count(dependencies/dependency)" />
		
		<xsl:for-each select="dependencies/dependency">
			{source: "<xsl:value-of select="$unitId" /> (<xsl:value-of select="$unitDepCount" />)", target: "<xsl:value-of select="." />"},
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>