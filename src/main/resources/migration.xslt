<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:ui="http://java.sun.com/jsf/facelets" xmlns:h="http://java.sun.com/jsf/html" xmlns:rich="http://richfaces.org/rich"
                xmlns:a4j="http://richfaces.org/a4j" xmlns:a="http://richfaces.org/a4j"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:p="http://primefaces.org/ui" xmlns:pe="http://primefaces.org/ui/extensions"
                exclude-result-prefixes="a4j a rich">

    <xsl:output
            method="xml"
            encoding="utf-8"
            doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
            doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
            indent="no"
            omit-xml-declaration="yes"
            exclude-result-prefixes="a4j a rich"
    />



    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>

    <!-- script tag -->
    <xsl:template match="//script" priority="20" xpath-default-namespace="http://www.w3.org/1999/xhtml" >
        <xsl:element name="script" xmlns="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="type">text/javascript</xsl:attribute>
            <xsl:copy-of select="@*"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[//<]]></xsl:text><xsl:text disable-output-escaping="yes">![CDATA[</xsl:text>
            <xsl:value-of select="." disable-output-escaping="yes"/>
            <xsl:text>//]]</xsl:text><xsl:text disable-output-escaping="yes"><![CDATA[>]]></xsl:text>
        </xsl:element>
    </xsl:template>

    <xsl:template match="a4j:region">
        <xsl:apply-templates/>
    </xsl:template>


    <xsl:template match="a4j:ajax" name="a4j:ajax">
        <p:ajax>
            <xsl:apply-templates select="@*|node()" />
        </p:ajax>
    </xsl:template>
    <xsl:template match="a4j:ajax/@render">
        <xsl:attribute name="update"><xsl:value-of select="." /></xsl:attribute>
    </xsl:template>

    <xsl:template match="a4j:ajax/@execute">
        <xsl:attribute name="process"><xsl:value-of select="." /></xsl:attribute>
    </xsl:template>


    <xsl:template match="a4j:status" name="a4j:status">
        <p:ajaxStatus>
            <xsl:apply-templates select="@*|node()" />
        </p:ajaxStatus>
    </xsl:template>


    <!--Command button-->
    <xsl:template match="a4j:commandButton" name="a4j:commandButton">
        <p:commandButton>
            <xsl:apply-templates select="@*|node()" />
        </p:commandButton>
    </xsl:template>
    <xsl:template match="a4j:commandButton/@render">
        <xsl:attribute name="update"><xsl:value-of select="." /></xsl:attribute>
    </xsl:template>
    <xsl:template match="a4j:commandButton/@execute">
        <xsl:attribute name="process"><xsl:value-of select="." /></xsl:attribute>
    </xsl:template>

    <!--a4j:commandLink-->
    <xsl:template match="a4j:commandLink" name="a4j:commandLink">
        <p:commandLink>
            <xsl:apply-templates select="@*|node()" />
        </p:commandLink>
    </xsl:template>
    <xsl:template match="a4j:commandLink/@render">
        <xsl:attribute name="update"><xsl:value-of select="." /></xsl:attribute>
    </xsl:template>
    <xsl:template match="a4j:commandLink/@execute">
        <xsl:attribute name="process"><xsl:value-of select="." /></xsl:attribute>
    </xsl:template>

    <!--a4j:jsFunction-->
    <xsl:template match="a4j:jsFunction" name="a4j:jsFunction">
        <pe:remoteCommand>
            <xsl:apply-templates select="@*|node()" />
        </pe:remoteCommand>
    </xsl:template>
    <xsl:template match="a4j:jsFunction/@render">
        <xsl:attribute name="update"><xsl:value-of select="." /></xsl:attribute>
    </xsl:template>
    <xsl:template match="a4j:jsFunction/@execute">
        <xsl:attribute name="process"><xsl:value-of select="." /></xsl:attribute>
    </xsl:template>

    <xsl:template match="a4j:jsFunction/a4j:param">
        <pe:assignableParam>
            <xsl:apply-templates select="node()|@*"/>
        </pe:assignableParam>
    </xsl:template>

    <!--a4j:queue TODO-->
    <xsl:template match="a4j:queue" />

    <!-- a4j:attachQueue TODO-->
    <xsl:template match="a4j:attachQueue" />



    <!--a4j:repeat-->
    <xsl:template match="a4j:repeat" name="a4j:repeat">
        <ui:repeat>
            <xsl:apply-templates select="@*|node()" />
        </ui:repeat>
    </xsl:template>

    <!--rich:dataTable-->
    <xsl:template match="rich:dataTable" name="rich:dataTable">
        <p:dataTable>
            <xsl:apply-templates select="@*|node()" />
        </p:dataTable>
    </xsl:template>
    <xsl:template match="rich:dataTable/@rowKeyVar">
        <xsl:attribute name="rowIndexVar"><xsl:value-of select="." /></xsl:attribute>
    </xsl:template>

    <!--rich:column-->
    <xsl:template match="rich:column" name="rich:column">
        <p:column>
            <xsl:apply-templates select="@*|node()" />
        </p:column>
    </xsl:template>


    <!--rich:toolbar-->
    <xsl:template match="rich:toolbar" name="rich:toolbar">
        <p:toolbar>
            <xsl:apply-templates select="@*|node()" />
        </p:toolbar>
    </xsl:template>

    <!--rich:toolbarGroup TODO -->

    <!--rich:tooltip-->
    <xsl:template match="rich:tooltip" name="rich:tooltip">
        <p:tooltip>
            <xsl:apply-templates select="@*|node()" />
        </p:tooltip>
    </xsl:template>


    <!--rich:panel-->
    <xsl:template match="rich:panel" name="rich:panel">
        <p:panel>
            <xsl:apply-templates select="@*|node()" />
        </p:panel>
    </xsl:template>

    <!--rich:hotKey-->
    <xsl:template match="rich:hotKey" name="rich:hotKey">
        <p:hotkey>
            <xsl:apply-templates select="@*|node()" />
        </p:hotkey>
    </xsl:template>
    <xsl:template match="rich:hotKey/@key">
        <xsl:attribute name="bind"><xsl:value-of select="." /></xsl:attribute>
    </xsl:template>
    <xsl:template match="rich:hotKey/@render">
        <xsl:attribute name="update"><xsl:value-of select="." /></xsl:attribute>
    </xsl:template>
    <xsl:template match="rich:hotKey/@execute">
        <xsl:attribute name="process"><xsl:value-of select="." /></xsl:attribute>
    </xsl:template>

    <!--rich:popupPanel-->

</xsl:stylesheet>