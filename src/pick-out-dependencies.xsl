<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>
	
	<xsl:template match="/packJSStructure">
		"use strict";
		window.links = [
			<xsl:apply-templates select="module/dependencies/dependency | file/dependencies/dependency"/>
		]
	</xsl:template>
	
	<xsl:template match="dependencies/dependency">
		{source: "<xsl:value-of select="../../id"/>", target: "<xsl:value-of select="."/>"}
		<xsl:if test="position() != last()">,</xsl:if>
	</xsl:template>
</xsl:stylesheet>