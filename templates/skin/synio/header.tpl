{locale path="{cfg name='locale.path'}" domain="messages"}
<!doctype html>
<html lang="ru">
<head>
    {hook run='html_head_begin'}

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>{$sHtmlTitle}</title>

    <meta name="description" content="{$sHtmlDescription}">
    <meta name="keywords" content="{$sHtmlKeywords}">

    <link rel="stylesheet" type="text/css" href="{cfg name='path.static.url'}/{cfg name='misc.ver.front'}/main.css">
    {if isset($styles)}
        {foreach from=$styles item=item}
            <link rel="stylesheet" type="text/css" href="{cfg name='path.static.url'}/{cfg name='misc.ver.front'}/{$item}.css">
        {/foreach}
    {/if}

    <link href="{cfg name='path.static.url'}/local/favicon.ico" rel="shortcut icon"/>
    <link rel="search" type="application/opensearchdescription+xml" href="{router page='search'}opensearch/" title="{cfg name='view.name'}"/>

    {if $aHtmlRssAlternate}
        <link rel="alternate" type="application/rss+xml" href="{$aHtmlRssAlternate.url}"
              title="{$aHtmlRssAlternate.title}">
    {/if}

    {if $sHtmlCanonical}
        <link rel="canonical" href="{$sHtmlCanonical}"/>
    {/if}

    {if isset($bRefreshToHome)}
        <meta HTTP-EQUIV="Refresh" CONTENT="3; URL={cfg name='path.root.web'}/">
    {/if}
    {include 'analytics.tpl'}
    {hook run='html_head_end'}
</head>

{add_block group='toolbar' name='toolbar_admin.tpl' priority=100}

<body class="width-fixed">
{hook run='body_begin'}


{if $oUserCurrent}
    {include file='window_write.tpl'}
    {include file='window_favourite_form_tags.tpl'}
{else}
    {include file='window_login.tpl'}
{/if}

<div id="widemode">
    <a id="despoil" title="Раскрыть/закрыть все спойлеры на странице">Despoil</a>
    <a id="widemode-switch" title="Переключить режим отображения страницы">
        <span class="switch-label widemode big-screen"><< Wide mode >></span>
        <span class="switch-label normalmode big-screen">>> Normal mode << </span>
        <span class="switch-label widemode small-screen"><< SideBar <<</span>
        <span class="switch-label normalmode small-screen">>> SideBar >></span>
    </a>
    <a id="up-switch" title="Наверх"></a>
    <a id="down-switch" title="Вниз"></a>
</div>

<div id="container" class="{hook run='container_class'}">
    {if !isset($noSidebar)}
        {assign var="noSidebar" value=false}
    {/if}
    {if !isset($sMenuHeadItemSelect)}
        {assign var="sMenuHeadItemSelect" value=''}
    {/if}
    {if !isset($sMenuItemSelect)}
        {assign var="sMenuItemSelect" value=''}
    {/if}
    {include file='header_top.tpl'}
    <div id="wrapper" class="{if $noSidebar}no-sidebar{/if}{hook run='wrapper_class'}">
        {if !$noSidebar}
            {include file='sidebar.tpl'}
        {/if}

        <div id="content-wrapper">
            <div id="content" role="main" {if $sMenuItemSelect=='profile'}itemscope
                 itemtype="http://data-vocabulary.org/Person"{/if}>
                {include file='nav_content.tpl'}
                {include file='system_message.tpl' noShowSystemMessage=false}

                {hook run='content_begin'}
