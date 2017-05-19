module ApplicationHelper
  
  
  def aws_parser(aws)
    split = aws.split('//s3')
    split.unshift('http://s3-us-east-2').join('')
  end
  
  
end
