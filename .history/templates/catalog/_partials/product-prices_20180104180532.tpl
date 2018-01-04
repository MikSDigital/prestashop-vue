{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{if $product.show_price}
  <div class="product-prices">
    {block name='product_price'}
      <div class="product-price d-flex align-items-center mb-2 {if $product.has_discount}has-discount{/if}" itemprop="offers" itemscope itemtype="https://schema.org/Offer">
        {block name='product_discount'}
          {if $product.has_discount}
            <div class="product-discount mr-2">
              {hook h='displayProductPriceBlock' product=$product type="old_price"}
              <span class="regular-price">{$product.regular_price}</span>
            </div>
          {/if}
        {/block}
        <link itemprop="availability" href="https://schema.org/InStock"/>
        <span class="mb-0 mr-1 h6" itemprop="price" content="{$product.price_amount}">
          {$product.price}
        </span>
        {if $configuration.display_taxes_label}
          <small class="form-text text-muted mr-2 mt-0">
            {$product.labels.tax_short}
          </small>
        {/if}

        <meta itemprop="priceCurrency" content="{$currency.iso_code}">
        {hook h='displayProductPriceBlock' product=$product type="price"}
        {if $product.has_discount}
          {if $product.discount_type === 'percentage'}
            <span class="discount-percentage text-danger">
              {l s='save %percentage%' d='Shop.Theme.Catalog' sprintf=['%percentage%' => $product.discount_percentage]}
            </span>
          {else}
            <span class="discount-amount text-danger">
              {l s='Save %amount%' d='Shop.Theme.Catalog' sprintf=['%amount%' => $product.discount_amount]}
            </span>
          {/if}
        {/if}
      </div>
    {/block}

    {block name='product_without_taxes'}
      {if $priceDisplay == 2}
        <p class="product-without-taxes">
          {l s='%price% tax excl.' d='Shop.Theme.Catalog' sprintf=['%price%' => $product.price_tax_exc]}
        </p>
      {/if}
    {/block}

    {block name='product_pack_price'}
      {if $displayPackPrice}
        <p class="product-pack-price">
          <span>
            {l s='Instead of %price%' d='Shop.Theme.Catalog' sprintf=['%price%' => $noPackPrice]}
          </span>
        </p>
      {/if}
    {/block}

    {block name='product_ecotax'}
      {if $product.ecotax.amount > 0}
        <p class="price-ecotax">
          {l s='Including %amount% for ecotax' d='Shop.Theme.Catalog' sprintf=['%amount%' => $product.ecotax.value]}
          {if $product.has_discount}
            {l s='(not impacted by the discount)' d='Shop.Theme.Catalog'}
          {/if}
        </p>
      {/if}
    {/block}

    {block name='product_unit_price'}
      {if $displayUnitPrice}
        <p class="product-unit-price">{l s='(%unit_price%)' d='Shop.Theme.Catalog' sprintf=['%unit_price%' => $product.unit_price_full]}</p>
      {/if}
    {/block}

    {hook h='displayProductPriceBlock' product=$product type="weight" hook_origin='product_sheet'}
    {hook h='displayProductPriceBlock' product=$product type="after_price"}

    {if isset($product.delivery_information)}
      <span class="delivery-information">
        {$product.delivery_information}
      </span>
    {/if}
  </div>
{/if}
