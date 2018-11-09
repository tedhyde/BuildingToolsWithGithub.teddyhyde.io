GA = <<"END"

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-127650375-2"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-127650375-2');
</script>

END

Dir.glob('*.html').each do |f|
  puts f
  contents = File.read( f )

  contents.gsub!( '</head>', GA + '</head>' )

  File.open( f, "w+" ) do |o|
    o.write( contents )
  end
end


