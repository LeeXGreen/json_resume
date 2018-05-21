#!/usr/bin/env ruby

require 'nokogiri'
require 'pry'

def nokogiri_doc(path)
  File.open(path) do |f|
    Nokogiri::HTML(f.read)
  end
end

def write_doc(doc, path)
  File.open(path, 'w') do |f|
    f << doc.to_html
  end
end

def move_sub_bullets(previous, sub_bullets)
  return if sub_bullets.empty?
  raise "WTF" if previous == nil

  el = previous.add_child("<ul></ul>")[0]
  sub_bullets.each do |sb|
    sb.parent = el
  end
end

def process_sub_bullets(doc)
  highlights = doc.css('section.experience > section.item > ul.highlights')
  highlights.each do |high|
    previous = nil
    sub_bullets = []

    high.children.each do |c|
      next if c.is_a? Nokogiri::XML::Text
      next unless c.name == 'li'

      text_el = c.children.first
      if (text_el.text =~ /^\* /)
        sub_bullets << c
        text_el.content = text_el.content[2..-1] # strip the "* "
      else
        move_sub_bullets(previous, sub_bullets)
        sub_bullets = []
        previous = c
      end

    end

    move_sub_bullets(previous, sub_bullets)
    sub_bullets = []
  end
end

path = ARGV[0]
doc = nokogiri_doc(path)
process_sub_bullets(doc)
write_doc(doc, path)

