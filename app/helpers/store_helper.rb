module StoreHelper

  def product_html product, photo, product_name, price
    @i ||= 0
    html = ''
    @i < 3 ? @i += 1 : @i = 1

    if @i == 1
      html += '<div class="grids_of_3">'
    end

    html += '<div class="grid1_of_3">'
    html += link_to store_product_path(product) do
              image_tag(photo) +
              ('<h3>' + truncate(product_name, length: 60) + '</h3>' +
                '<div class="price"><h4>$' + price.to_s +
                '<span>shop now</span></h4></div>' +
                '<span class="b_btm"></span>').html_safe
            end
    html += '</div>'

    if @i == 3
      html += '<div class="clear"></div></div>'
    end
    html.html_safe
  end

  def clear_html
    if @i > 0 && @i != 3
      '<div class="clear"></div></div>'.html_safe
    end
  end

  def photos_product product
    main_orig = "#{raw asset_url(product.photos[0].orig)}"
    main_main = "#{raw asset_url(product.photos[0].orig)}"
    main_thumb = "#{raw asset_url(product.photos[0].small)}"

    gallery = '\"gallery\":{'
    i = 0
    product.photos.each do |photo|
      comma = (i == 0) ? '' : ', '
      gallery += comma + '\"item_'+ i.to_s + '\":{\"orig\":\"'+ raw(asset_url(photo.orig))
      gallery += '\",\"main\":\"'+ raw(asset_url(photo.large))
      gallery += '\", \"thumb\":\"'+ raw(asset_url(photo.small)) + '\",\"label\":\"\"}'
      i +=1
    end
    photos = '{\"prod_1\":{\"main\":{\"orig\":\"' + main_orig + 
        '\",\"main\":\"' + main_main + '\",\"thumb\":\"'+ 
        main_thumb +'\",\"label\":\"\"},'+ gallery +
        '},\"type\":\"simple\",\"video\":false}}'
    photos.to_s.html_safe
  end
end
