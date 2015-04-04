require "java"

java_import java.awt.BorderLayout
java_import java.awt.event.ActionEvent
java_import java.awt.event.ActionListener

java_import javax.swing.DefaultListModel
java_import javax.swing.JButton
java_import javax.swing.JFrame
java_import javax.swing.JList
java_import javax.swing.JPanel
java_import javax.swing.JScrollPane

class ListModel < JPanel
  def initialize
    super
    setLayout BorderLayout.new
    model = DefaultListModel.new
    list = JList.new model
    pane = JScrollPane.new list

    add pane, BorderLayout::NORTH
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
