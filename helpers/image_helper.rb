module ImageHelper
  # def image_set_tag(source, srcset = {}, options = {})
  #   srcset = srcset.map { |src, size| "#{image_path(src)} #{size}" }.join(', ')
  #   image_tag(source, options.merge(srcset: srcset))
  # end

  def image_set_tag(source, options = {})
    source_path_extension = Pathname.new(source).extname
    base_source_path = source.gsub(source_path_extension, "")

    srcset_array = options[:srcset].map do |size|
      src = "#{base_source_path}_#{size}#{source_path_extension}"
      "#{image_path(src)} #{size}"
    end
    options[:srcset] = srcset_array.join(", ")

    image_tag(source, options)
  end

end
