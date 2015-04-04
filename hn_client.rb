require "java"
require 'rss'

java_import java.awt.BorderLayout
java_import java.awt.event.ActionEvent
java_import java.awt.event.ActionListener

java_import javax.swing.DefaultListModel
java_import javax.swing.JButton
java_import javax.swing.JFrame
java_import javax.swing.JList
java_import javax.swing.JPanel
java_import javax.swing.JScrollPane

class RssParser
  attr_reader :items

  def initialize
    @items = RSS::Parser.parse(open('https://news.ycombinator.com/rss').read, false).items[0...30]
  end
end

class ListModel < JPanel
  def initialize
    super
    setLayout BorderLayout.new
    model = DefaultListModel.new
    list = JList.new model
    pane = JScrollPane.new list
    parser = RssParser.new
    parser.items.each { |item| model.add_element item.title }
    add pane
  end
end

class HNClient < JFrame
  def initialize
    super
    frame = JFrame.new("Hacker News Client")
    frame.setDefaultCloseOperation(JFrame::EXIT_ON_CLOSE)
    frame.setContentPane ListModel.new
    frame.setSize(1024, 768)
    frame.setVisible(true)
  end
end

HNClient.new
