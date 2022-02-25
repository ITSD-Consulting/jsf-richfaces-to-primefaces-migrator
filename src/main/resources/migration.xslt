<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:ui="http://java.sun.com/jsf/facelets"
	xmlns:h="http://java.sun.com/jsf/html"
	xmlns:rich="http://richfaces.org/rich"
	xmlns:a4j="http://richfaces.org/a4j" xmlns:a="http://richfaces.org/a4j"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:p="http://primefaces.org/ui"
	xmlns:pe="http://primefaces.org/ui/extensions"
	xmlns:f="http://java.sun.com/jsf/core"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	exclude-result-prefixes="#all">

	<xsl:output method="xml" encoding="utf-8"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		indent="no" omit-xml-declaration="yes" />

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>

	<!-- script tag -->
	<xsl:template match="//script" priority="20"
		xpath-default-namespace="http://www.w3.org/1999/xhtml">
		<xsl:element name="script"
			xmlns="http://www.w3.org/1999/xhtml">
			<xsl:attribute name="type">text/javascript</xsl:attribute>
			<xsl:copy-of select="@*" />
			<xsl:text disable-output-escaping="yes"><![CDATA[//<]]></xsl:text>
			<xsl:text disable-output-escaping="yes">![CDATA[</xsl:text>
			<xsl:value-of select="." disable-output-escaping="yes" />
			<xsl:text>//]]</xsl:text>
			<xsl:text disable-output-escaping="yes"><![CDATA[>]]></xsl:text>
		</xsl:element>
	</xsl:template>

	<xsl:template match="a4j:region">
		<xsl:apply-templates />
	</xsl:template>


	<xsl:template match="a4j:support" name="a4j:support">
		<p:ajax>
			<xsl:apply-templates select="@*|node()" />
		</p:ajax>
	</xsl:template>
	<xsl:template match="a4j:ajax/@reRender">
		<xsl:attribute name="update"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>

	<xsl:template match="a4j:support/@execute">
		<xsl:attribute name="process"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>


	<xsl:template match="a4j:status" name="a4j:status">
		<p:ajaxStatus>
			<xsl:apply-templates select="@*|node()" />
		</p:ajaxStatus>
	</xsl:template>


	<!--Command button -->
	<xsl:template match="a4j:commandButton"
		name="a4j:commandButton">
		<h:commandButton>
			<xsl:apply-templates select="@*|node()" />
		</h:commandButton>
	</xsl:template>
	<xsl:template match="a4j:commandButton/@reRender">
		<xsl:attribute name="update"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>
	<xsl:template match="a4j:commandButton/@execute">
		<xsl:attribute name="process"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>

	<!--a4j:commandLink -->
	<xsl:template match="a4j:commandLink"
		name="a4j:commandLink">
		<p:commandLink>
			<xsl:apply-templates select="@*|node()" />
		</p:commandLink>
	</xsl:template>
	<xsl:template match="a4j:commandLink/@reRender">
		<xsl:attribute name="update"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>
	<xsl:template match="a4j:commandLink/@execute">
		<xsl:attribute name="process"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>

	<!--a4j:jsFunction -->
	<xsl:template match="a4j:jsFunction" name="a4j:jsFunction">
		<pe:remoteCommand>
			<xsl:apply-templates select="@*|node()" />
		</pe:remoteCommand>
	</xsl:template>
	<xsl:template match="a4j:jsFunction/@reRender">
		<xsl:attribute name="update"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>
	<xsl:template match="a4j:jsFunction/@execute">
		<xsl:attribute name="process"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>

	<xsl:template match="a4j:jsFunction/a4j:param">
		<pe:assignableParam>
			<xsl:apply-templates select="node()|@*" />
		</pe:assignableParam>
	</xsl:template>

	<!--a4j:queue TODO -->
	<xsl:template match="a4j:queue" />

	<!-- a4j:attachQueue TODO -->
	<xsl:template match="a4j:attachQueue" />



	<!--a4j:repeat rowKeyVar -->
	<xsl:template match="a4j:repeat" name="a4j:repeat">
		<ui:repeat>
			<xsl:apply-templates select="@*|node()" />
		</ui:repeat>
	</xsl:template>

	<!--rich:dataTable -->
	<xsl:template match="rich:dataTable" name="rich:dataTable">
		<p:dataTable>
			<xsl:apply-templates select="@*|node()" />
		</p:dataTable>
	</xsl:template>
	<xsl:template match="rich:dataTable/@rowKeyVar">
		<xsl:attribute name="rowIndexVar"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>

	<!--rich:column -->
	<xsl:template match="rich:column" name="rich:column">
		<p:column>
			<xsl:apply-templates select="@*|node()" />
		</p:column>
	</xsl:template>


	<!--rich:toolbar -->
	<xsl:template match="rich:toolbar" name="rich:toolbar">
		<p:toolbar>
			<xsl:apply-templates select="@*|node()" />
		</p:toolbar>
	</xsl:template>

	<!--rich:toolbarGroup -->
	<xsl:template match="rich:toolbarGroup"
		name="rich:toolbarGroup">
		<p:toolbarGroup>
			<xsl:apply-templates select="@*|node()" />
		</p:toolbarGroup>
	</xsl:template>

	<xsl:template match="rich:toolbarGroup/@location">
		<xsl:attribute name="align"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>


	<!--rich:tooltip -->
	<xsl:template match="rich:tooltip" name="rich:tooltip">
		<p:tooltip>
			<xsl:apply-templates select="@*|node()" />
		</p:tooltip>
	</xsl:template>


	<!--rich:panel -->
	<xsl:template match="rich:panel" name="rich:panel">
		<p:panel>
			<xsl:apply-templates select="@*|node()" />
		</p:panel>
	</xsl:template>

	<!--rich:hotKey -->
	<xsl:template match="rich:hotKey" name="rich:hotKey">
		<p:hotkey>
			<xsl:apply-templates select="@*|node()" />
		</p:hotkey>
	</xsl:template>
	<xsl:template match="rich:hotKey/@key">
		<xsl:attribute name="bind"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>
	<xsl:template match="rich:hotKey/@reRender">
		<xsl:attribute name="update"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>
	<xsl:template match="rich:hotKey/@execute">
		<xsl:attribute name="process"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>

	<!--rich:modalPanel -->
	<xsl:template match="rich:modalPanel"
		name="rich:modalPanel">
		<p:dialog modal="true">
			<xsl:apply-templates select="@*|node()" />
		</p:dialog>
	</xsl:template>


	<!--rich:contextMenu -->
	<xsl:template match="rich:contextMenu"
		name="rich:contextMenu">
		<p:contextMenu>
			<xsl:apply-templates select="@*|node()" />
		</p:contextMenu>
	</xsl:template>

	<!--rich:menuItem -->
	<xsl:template match="rich:menuItem" name="rich:menuItem">
		<p:menuitem>


			<xsl:apply-templates select="@*|node()" />

			<xsl:element name="span">
				<xsl:value-of select="@label" />
			</xsl:element>

		</p:menuitem>
	</xsl:template>


	<xsl:template match="rich:menuItem/@reRender">
		<xsl:attribute name="update"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>
	<xsl:template match="rich:menuItem/@execute">
		<xsl:attribute name="process"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>



	<!--rich:tree -->
	<xsl:template match="rich:tree" name="rich:tree">
		<p:tree>
			<xsl:apply-templates select="@*|node()" />
		</p:tree>
	</xsl:template>
	<xsl:template match="rich:tree/@reRender">
		<xsl:attribute name="update"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>
	<xsl:template match="rich:tree/@execute">
		<xsl:attribute name="process"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>

	<!--rich:treeNode -->
	<xsl:template match="rich:treeNode" name="rich:treeNode">
		<p:treeNode>
			<xsl:apply-templates select="@*|node()" />
		</p:treeNode>
	</xsl:template>
	<xsl:template match="rich:treeNode/@reRender">
		<xsl:attribute name="update"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>
	<xsl:template match="rich:treeNode/@execute">
		<xsl:attribute name="process"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>


	<xsl:template match="rich:dataGrid" name="rich:dataGrid">
		<p:dataGrid>
			<xsl:apply-templates select="@*|node()" />
		</p:dataGrid>
	</xsl:template>
	<xsl:template match="rich:dataGrid/@rowKeyVar">
		<xsl:attribute name="rowIndexVar"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>

	<!--a4j:outputPanel -->

	<xsl:template match="a4j:outputPanel"
		name="a4j:outputPanel">
		<p:outputPanel>
			<xsl:apply-templates select="@*|node()" />
		</p:outputPanel>
	</xsl:template>
	<xsl:template match="a4j:outputPanel/@ajaxRendered">
		<xsl:attribute name="autoUpdate"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>

	<!--rich:tabPanel -->

	<xsl:template match="rich:tabPanel" name="rich:tabPanel">
		<p:tabView>
			<xsl:apply-templates select="@*|node()" />
		</p:tabView>
	</xsl:template>

	<!--rich:tab -->
	<xsl:template match="rich:tab" name="rich:tab">
		<p:tab>
			<xsl:apply-templates select="@*|node()" />
		</p:tab>
	</xsl:template>
	<xsl:template match="rich:tab/@header">
		<xsl:attribute name="title"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>

	<!--rich:calendar -->
	<xsl:template match="rich:calendar" name="rich:calendar">
		<p:calendar>
			<xsl:if test="f:attribute[@name = 'maxlength']">
				<xsl:variable name="AttributeMaxLength"
					select="string(f:attribute/@value)" />

				<xsl:attribute name="maxlength"><xsl:value-of
					select="$AttributeMaxLength" /></xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="@enableManualInput eq 'true'">
					<xsl:attribute name="readOnlyInput">
		<xsl:value-of select="'false'" /></xsl:attribute>
				</xsl:when>
				<xsl:when test="@enableManualInput eq 'false'">
					<xsl:attribute name="readOnlyInput">
		<xsl:value-of select="'true'" /></xsl:attribute>
				</xsl:when>
			</xsl:choose>
			<xsl:apply-templates select="@*|node()" />

		</p:calendar>
	</xsl:template>
	<xsl:template match="rich:calendar/@datePattern">
		<xsl:attribute name="pattern"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>
	<xsl:template match="rich:calendar/@direction">
		<xsl:attribute name="dir"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>
	<xsl:template match="rich:calendar/@showFooter">
		<xsl:attribute name="showButtonPanel"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>
	<xsl:template match="rich:calendar/@inputSize">
		<xsl:attribute name="size"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>
	<xsl:template match="rich:calendar/@enableManualInput">
	</xsl:template>
	<xsl:template match="rich:calendar/@showApplyButton">
	</xsl:template>
	<!--rich:editor -->
	<xsl:template match="rich:editor" name="rich:editor">
		<p:editor>
			<xsl:apply-templates select="@*|node()" />
		</p:editor>
	</xsl:template>
	<xsl:template match="f:attribute[@name='maxlength']"
		name="f:attribute">
	</xsl:template>


	<!--rich:inplaceInput -->
	<xsl:template match="rich:inplaceInput"
		name="rich:inplaceInput">
		<p:inplace>
			<xsl:apply-templates select="@*|node()" />

			<xsl:element name="h:inputText">
				<xsl:attribute name="value"><xsl:value-of
					select="@value" /></xsl:attribute>
			</xsl:element>
		</p:inplace>
	</xsl:template>
	<xsl:template match="rich:inplaceInput/@value" />
	<xsl:template match="rich:inplaceInput/@editEvent">
		<xsl:attribute name="event"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>

	<!--rich:fileUpload -->

	<xsl:template match="rich:fileUpload"
		name="rich:fileUpload">
		<p:fileUpload>
			<xsl:apply-templates select="@*|node()" />
		</p:fileUpload>
	</xsl:template>
	<xsl:template match="rich:fileUpload/@maxFilesQuantity">
		<xsl:attribute name="fileLimit"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>
	<xsl:template match="rich:fileUpload/@addLabel">
		<xsl:attribute name="label"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>
	<xsl:template match="rich:fileUpload/@acceptedTypes"> <!--FIXME allowTypes is regex -->
		<xsl:attribute name="allowTypes"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>
	<xsl:template match="rich:fileUpload/@immediateUpload">
		<xsl:attribute name="auto"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>
	<xsl:template match="rich:fileUpload/@onuploadcomplete">
		<xsl:attribute name="oncomplete"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>
	<xsl:template match="rich:fileUpload/@reRender">
		<xsl:attribute name="update"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>
	<xsl:template match="rich:fileUpload/@execute">
		<xsl:attribute name="process"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>



	<xsl:template match="rich:message" name="rich:message">
		<p:message>
			<xsl:apply-templates select="@*|node()" />
		</p:message>
	</xsl:template>
	<xsl:template match="rich:message/@level">
		<xsl:attribute name="severity"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>

	<xsl:template match="rich:messages" name="rich:messages">
		<p:messages>
			<xsl:apply-templates select="@*|node()" />
		</p:messages>
	</xsl:template>
	<xsl:template match="rich:messages/@level">
		<xsl:attribute name="severity"><xsl:value-of
			select="." /></xsl:attribute>
	</xsl:template>


	<xsl:template match="a4j:include" name="a4j:include">
		<ui:include>
			<xsl:apply-templates select="@*|node()" />
		</ui:include>
	</xsl:template>


	<xsl:template match="rich:simpleTogglePanel"
		name="rich:simpleTogglePanel">
		<p:accordionPanel>
			<p:tab>
				<xsl:apply-templates select="@*|node()" />
			</p:tab>
		</p:accordionPanel>
	</xsl:template>

	<xsl:template match="rich:listShuttle"
		name="rich:listShuttle">
		<p:pickList>
			<xsl:apply-templates select="@*|node()" />
		</p:pickList>
	</xsl:template>

	<xsl:template match="rich:spacer" name="rich:spacer">
		<p:spacer>
			<xsl:apply-templates select="@*|node()" />
		</p:spacer>
	</xsl:template>

	<!--autoclear -->



</xsl:stylesheet>