{ezcss_require( array('socialbuttons.css') )}

{def $avaiable_sizes = array( 'default', '32x32' )
     $size = '32x32'}

<div class="attribute-social block float-break">
  <div class="style_{$size}">

    <div class="addthis_toolbox addthis_default_style addthis_{$size}_style">
        <a class="addthis_button_facebook"></a>
        <a class="addthis_button_twitter"></a>
        <a class="addthis_button_google_plusone_share"></a>
        <a class="addthis_button_linkedin"></a>
    </div>
    <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-4f968e496faa2765"></script>

    
    {def $tipafriend_access=fetch( 'user', 'has_access_to', hash( 'module', 'content', 'function', 'tipafriend' ) )}    
    {if and( ezmodule( 'content/tipafriend' ), $tipafriend_access )}
        <div class="social-button tipafriend">
            <a href={concat( "/content/tipafriend/", $node.node_id )|ezurl} title="{'Tip a friend'|i18n( 'design/ezwebin/full/article' )}">
                <span>{'Tip a friend'|i18n( 'design/ezwebin/full/article' )}</span>
            </a>
        </div>
    {/if}
    
    <div class="social-button print">
        <a href="javascript:window.print()" title="Stampa la pagina corrente">
            <span>Versione stampabile</span>
        </a>
    </div>
    
    {def $rss_export = fetch( 'rss', 'export_by_node', hash( 'node_id', $node.node_id ) )}
    {if $rss_export}
        <div class="social-button rss">
            <a href="{concat( '/rss/feed/', $rss_export.access_url )|ezurl( 'no' )}" title="{$rss_export.title|wash()}">
                <span>RSS {$rss_export.title|wash()}</span>
            </a>
        </div>
    {/if}

    {if is_set( $node.data_map.star_rating )}
        <div class="attribute-star_rating">
            {attribute_view_gui attribute=$node.data_map.star_rating}
        </div>
    {/if}

  </div>
</div>