---
# 常用定义
title: "JAVA LIST"                  # 标题
date: 2019-04-02T10:52:35+08:00    # 创建时间
lastmod: 2019-04-02T10:52:35+08:00 # 最后修改时间
draft: false                       # 是否是草稿？
tags: ["tag-1", "tag-2", "tag-3"]  # 标签
categories: ["index"]              # 分类
author: "小白"                     # 作者

# 用户自定义
# 你可以选择 关闭(false) 或者 打开(true) 以下选项
comment: false   #s 关闭评论
toc: false       # 关闭文章目录
# 你同样可以自定义文章的版权规则
contentCopyright: '<a rel="license noopener" href="https://creativecommons.org/licenses/by-nc-nd/4.0/" target="_blank">CC BY-NC-ND 4.0</a>'
reward: false	 # 关闭打赏
mathjax: true    # 打开 mathjax
---

# List：
Listdfdfdf中元素可以重复，并且是有序的（这里的有序指的是按照放入的顺序进行存储。如按照顺序把1，2，3存入List，那么，从List中遍历出来的顺序也是1，2，3）。
##  ArrayList：
1. 实际是一个数组，默认初始容量大小为 10，int size记录长度
2. 默认将扩容至原来容量的 1.5 倍
#### 方法特点：
1. ArrayList的当前容量足够大，add()操作的效率非常高，当扩容是进行大量的数组复制，最终将调用System.arraycopy()方法，add()效率相当高
2. arrayList实际是数组，数组是一块连续的内存空间，如果在数组的任意位置插入元素，必然导致在该位置后的所有元素需要重新排列，因此，其效率相对会比较低。
3. remove()方法和add()方法是雷同的。在任意位置移除元素后，都要进行数组的重组。删除的位置越靠前，数组重组时的开销越大。

#### 总结：
1. 按照插入顺序来保存元素，可以利用下标来查找值
2. 优：按照下标访问元素最快
3. 缺：在中间插入元素很慢
删除元素很慢

## LinkedList:
1. LinkedList使用了循环双向链表数据结构。因此没有容量限制

#### 方法特点：
1. add()将任意元素增加到队列的尾端，每次的元素增加都需要新建一个Entry对象，并进行更多的赋值操作。在频繁的系统调用中，对性能会产生一定的影响。
2. List接口还提供了在任意位置插入元素的方法：void add(int index,E element)，效率高;
3. 首先要通过循环找到要删除的元素。如果要删除的位置处于List的前半段，则从前往后找；若其位置处于后半段，则从后往前找。因此无论要删除较为靠前或者靠后的元素都是非常高效的；但要移除List中间的元素却几乎要遍历完半个List，在List拥有大量元素的情况下，效率很低。
4. 避免使用for循环,效率极低
#### 总结：
1. 按照插入顺序来保存元素，可以利用下标来查找值
2. 优：删除和添加数据所消耗的资源较少，且比ArrayList效率高。
3. 缺：线程不安全，查找消耗的资源大，效率低，不能随机访问。

## Vector（线程安全）：
1. 与arrayList实现基本一致，就是线程安全

## CopyOnWriteArrayList（线程安全）：
1. Copy-On-Write简称COW，是一种用于程序设计中的优化策略。其基本思路是，从一开始大家都在共享同一个内容，当某个人想要修改这个内容的时候，才会真正把内容Copy出去形成一个新的内容然后再改，这是一种延时懒惰策略。从JDK1.5开始Java并发包里提供了两个使用CopyOnWrite机制实现的并发容器,它们是CopyOnWriteArrayList和CopyOnWriteArraySet。CopyOnWrite容器非常有用，可以在非常多的并发场景中使用到。

#### 注意：
1. 减少扩容开销。根据实际需要，初始化CopyOnWriteMap的大小，避免写时CopyOnWriteMap扩容的开销。
2. 使用批量添加。因为每次添加，容器每次都会进行复制，所以减少添加次数，可以减少容器的复制次数。如使用上面代码里的addBlackList方法。

#### 缺点：
1. 内存占用问题。
2. 数据一致性问题。CopyOnWrite容器只能保证数据的最终一致性，不能保证数据的实时一致性。所以如果你希望写入的的数据，马上能读到，请不要使用CopyOnWrite容器。