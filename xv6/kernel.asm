
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc c0 b5 10 80       	mov    $0x8010b5c0,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 b0 2e 10 80       	mov    $0x80102eb0,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100044:	bb f4 b5 10 80       	mov    $0x8010b5f4,%ebx
{
80100049:	83 ec 0c             	sub    $0xc,%esp
  initlock(&bcache.lock, "bcache");
8010004c:	68 00 73 10 80       	push   $0x80107300
80100051:	68 c0 b5 10 80       	push   $0x8010b5c0
80100056:	e8 35 42 00 00       	call   80104290 <initlock>
  bcache.head.prev = &bcache.head;
8010005b:	c7 05 0c fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd0c
80100062:	fc 10 80 
  bcache.head.next = &bcache.head;
80100065:	c7 05 10 fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd10
8010006c:	fc 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba bc fc 10 80       	mov    $0x8010fcbc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
    b->next = bcache.head.next;
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
    b->prev = &bcache.head;
8010008b:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100092:	68 07 73 10 80       	push   $0x80107307
80100097:	50                   	push   %eax
80100098:	e8 c3 40 00 00       	call   80104160 <initsleeplock>
    bcache.head.next->prev = b;
8010009d:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
    bcache.head.next->prev = b;
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
    bcache.head.next = b;
801000b0:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000b6:	3d bc fc 10 80       	cmp    $0x8010fcbc,%eax
801000bb:	72 c3                	jb     80100080 <binit+0x40>
  }
}
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  acquire(&bcache.lock);
801000df:	68 c0 b5 10 80       	push   $0x8010b5c0
801000e4:	e8 e7 42 00 00       	call   801043d0 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000e9:	8b 1d 10 fd 10 80    	mov    0x8010fd10,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
    if(b->dev == dev && b->blockno == blockno){
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
      b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100120:	8b 1d 0c fd 10 80    	mov    0x8010fd0c,%ebx
80100126:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
      b->dev = dev;
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 c0 b5 10 80       	push   $0x8010b5c0
80100162:	e8 29 43 00 00       	call   80104490 <release>
      acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 2e 40 00 00       	call   801041a0 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
  struct buf *b;

  b = bget(dev, blockno);
  if((b->flags & B_VALID) == 0) {
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
    iderw(b);
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 ad 1f 00 00       	call   80102130 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
  }
  return b;
}
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
  panic("bget: no buffers");
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 0e 73 10 80       	push   $0x8010730e
80100198:	e8 f3 01 00 00       	call   80100390 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 8d 40 00 00       	call   80104240 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
  iderw(b);
801001c4:	e9 67 1f 00 00       	jmp    80102130 <iderw>
    panic("bwrite");
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 1f 73 10 80       	push   $0x8010731f
801001d1:	e8 ba 01 00 00       	call   80100390 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 4c 40 00 00       	call   80104240 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
    panic("brelse");

  releasesleep(&b->lock);
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 fc 3f 00 00       	call   80104200 <releasesleep>

  acquire(&bcache.lock);
80100204:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
8010020b:	e8 c0 41 00 00       	call   801043d0 <acquire>
  b->refcnt--;
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
  if (b->refcnt == 0) {
80100213:	83 c4 10             	add    $0x10,%esp
  b->refcnt--;
80100216:	83 e8 01             	sub    $0x1,%eax
  if (b->refcnt == 0) {
80100219:	85 c0                	test   %eax,%eax
  b->refcnt--;
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
  if (b->refcnt == 0) {
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
    // no one is waiting for it.
    b->next->prev = b->prev;
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
80100232:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
    b->prev = &bcache.head;
80100237:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
    b->next = bcache.head.next;
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
    bcache.head.next->prev = b;
80100241:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
80100249:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10
  }
  
  release(&bcache.lock);
8010024f:	c7 45 08 c0 b5 10 80 	movl   $0x8010b5c0,0x8(%ebp)
}
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
  release(&bcache.lock);
8010025c:	e9 2f 42 00 00       	jmp    80104490 <release>
    panic("brelse");
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 26 73 10 80       	push   $0x80107326
80100269:	e8 22 01 00 00       	call   80100390 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010027f:	57                   	push   %edi
80100280:	e8 eb 14 00 00       	call   80101770 <iunlock>
  target = n;
  acquire(&cons.lock);
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 3f 41 00 00       	call   801043d0 <acquire>
  while(n > 0){
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e a1 00 00 00    	jle    80100342 <consoleread+0xd2>
    while(input.r == input.w){
801002a1:	8b 15 a0 ff 10 80    	mov    0x8010ffa0,%edx
801002a7:	39 15 a4 ff 10 80    	cmp    %edx,0x8010ffa4
801002ad:	74 2c                	je     801002db <consoleread+0x6b>
801002af:	eb 5f                	jmp    80100310 <consoleread+0xa0>
801002b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(myproc()->killed){
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b8:	83 ec 08             	sub    $0x8,%esp
801002bb:	68 20 a5 10 80       	push   $0x8010a520
801002c0:	68 a0 ff 10 80       	push   $0x8010ffa0
801002c5:	e8 26 3b 00 00       	call   80103df0 <sleep>
    while(input.r == input.w){
801002ca:	8b 15 a0 ff 10 80    	mov    0x8010ffa0,%edx
801002d0:	83 c4 10             	add    $0x10,%esp
801002d3:	3b 15 a4 ff 10 80    	cmp    0x8010ffa4,%edx
801002d9:	75 35                	jne    80100310 <consoleread+0xa0>
      if(myproc()->killed){
801002db:	e8 70 35 00 00       	call   80103850 <myproc>
801002e0:	8b 40 24             	mov    0x24(%eax),%eax
801002e3:	85 c0                	test   %eax,%eax
801002e5:	74 d1                	je     801002b8 <consoleread+0x48>
        release(&cons.lock);
801002e7:	83 ec 0c             	sub    $0xc,%esp
801002ea:	68 20 a5 10 80       	push   $0x8010a520
801002ef:	e8 9c 41 00 00       	call   80104490 <release>
        ilock(ip);
801002f4:	89 3c 24             	mov    %edi,(%esp)
801002f7:	e8 94 13 00 00       	call   80101690 <ilock>
        return -1;
801002fc:	83 c4 10             	add    $0x10,%esp
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
801002ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return -1;
80100302:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100307:	5b                   	pop    %ebx
80100308:	5e                   	pop    %esi
80100309:	5f                   	pop    %edi
8010030a:	5d                   	pop    %ebp
8010030b:	c3                   	ret    
8010030c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = input.buf[input.r++ % INPUT_BUF];
80100310:	8d 42 01             	lea    0x1(%edx),%eax
80100313:	a3 a0 ff 10 80       	mov    %eax,0x8010ffa0
80100318:	89 d0                	mov    %edx,%eax
8010031a:	83 e0 7f             	and    $0x7f,%eax
8010031d:	0f be 80 20 ff 10 80 	movsbl -0x7fef00e0(%eax),%eax
    if(c == C('D')){  // EOF
80100324:	83 f8 04             	cmp    $0x4,%eax
80100327:	74 3f                	je     80100368 <consoleread+0xf8>
    *dst++ = c;
80100329:	83 c6 01             	add    $0x1,%esi
    --n;
8010032c:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
8010032f:	83 f8 0a             	cmp    $0xa,%eax
    *dst++ = c;
80100332:	88 46 ff             	mov    %al,-0x1(%esi)
    if(c == '\n')
80100335:	74 43                	je     8010037a <consoleread+0x10a>
  while(n > 0){
80100337:	85 db                	test   %ebx,%ebx
80100339:	0f 85 62 ff ff ff    	jne    801002a1 <consoleread+0x31>
8010033f:	8b 45 10             	mov    0x10(%ebp),%eax
  release(&cons.lock);
80100342:	83 ec 0c             	sub    $0xc,%esp
80100345:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100348:	68 20 a5 10 80       	push   $0x8010a520
8010034d:	e8 3e 41 00 00       	call   80104490 <release>
  ilock(ip);
80100352:	89 3c 24             	mov    %edi,(%esp)
80100355:	e8 36 13 00 00       	call   80101690 <ilock>
  return target - n;
8010035a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010035d:	83 c4 10             	add    $0x10,%esp
}
80100360:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100363:	5b                   	pop    %ebx
80100364:	5e                   	pop    %esi
80100365:	5f                   	pop    %edi
80100366:	5d                   	pop    %ebp
80100367:	c3                   	ret    
80100368:	8b 45 10             	mov    0x10(%ebp),%eax
8010036b:	29 d8                	sub    %ebx,%eax
      if(n < target){
8010036d:	3b 5d 10             	cmp    0x10(%ebp),%ebx
80100370:	73 d0                	jae    80100342 <consoleread+0xd2>
        input.r--;
80100372:	89 15 a0 ff 10 80    	mov    %edx,0x8010ffa0
80100378:	eb c8                	jmp    80100342 <consoleread+0xd2>
8010037a:	8b 45 10             	mov    0x10(%ebp),%eax
8010037d:	29 d8                	sub    %ebx,%eax
8010037f:	eb c1                	jmp    80100342 <consoleread+0xd2>
80100381:	eb 0d                	jmp    80100390 <panic>
80100383:	90                   	nop
80100384:	90                   	nop
80100385:	90                   	nop
80100386:	90                   	nop
80100387:	90                   	nop
80100388:	90                   	nop
80100389:	90                   	nop
8010038a:	90                   	nop
8010038b:	90                   	nop
8010038c:	90                   	nop
8010038d:	90                   	nop
8010038e:	90                   	nop
8010038f:	90                   	nop

80100390 <panic>:
{
80100390:	55                   	push   %ebp
80100391:	89 e5                	mov    %esp,%ebp
80100393:	56                   	push   %esi
80100394:	53                   	push   %ebx
80100395:	83 ec 30             	sub    $0x30,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100398:	fa                   	cli    
  cons.locking = 0;
80100399:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
801003a0:	00 00 00 
  getcallerpcs(&s, pcs);
801003a3:	8d 5d d0             	lea    -0x30(%ebp),%ebx
801003a6:	8d 75 f8             	lea    -0x8(%ebp),%esi
  cprintf("lapicid %d: panic: ", lapicid());
801003a9:	e8 92 23 00 00       	call   80102740 <lapicid>
801003ae:	83 ec 08             	sub    $0x8,%esp
801003b1:	50                   	push   %eax
801003b2:	68 2d 73 10 80       	push   $0x8010732d
801003b7:	e8 a4 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
801003bc:	58                   	pop    %eax
801003bd:	ff 75 08             	pushl  0x8(%ebp)
801003c0:	e8 9b 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003c5:	c7 04 24 df 7c 10 80 	movl   $0x80107cdf,(%esp)
801003cc:	e8 8f 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003d1:	5a                   	pop    %edx
801003d2:	8d 45 08             	lea    0x8(%ebp),%eax
801003d5:	59                   	pop    %ecx
801003d6:	53                   	push   %ebx
801003d7:	50                   	push   %eax
801003d8:	e8 d3 3e 00 00       	call   801042b0 <getcallerpcs>
801003dd:	83 c4 10             	add    $0x10,%esp
    cprintf(" %p", pcs[i]);
801003e0:	83 ec 08             	sub    $0x8,%esp
801003e3:	ff 33                	pushl  (%ebx)
801003e5:	83 c3 04             	add    $0x4,%ebx
801003e8:	68 41 73 10 80       	push   $0x80107341
801003ed:	e8 6e 02 00 00       	call   80100660 <cprintf>
  for(i=0; i<10; i++)
801003f2:	83 c4 10             	add    $0x10,%esp
801003f5:	39 f3                	cmp    %esi,%ebx
801003f7:	75 e7                	jne    801003e0 <panic+0x50>
  panicked = 1; // freeze other CPU
801003f9:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
80100400:	00 00 00 
80100403:	eb fe                	jmp    80100403 <panic+0x73>
80100405:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100410 <consputc>:
  if(panicked){
80100410:	8b 0d 58 a5 10 80    	mov    0x8010a558,%ecx
80100416:	85 c9                	test   %ecx,%ecx
80100418:	74 06                	je     80100420 <consputc+0x10>
8010041a:	fa                   	cli    
8010041b:	eb fe                	jmp    8010041b <consputc+0xb>
8010041d:	8d 76 00             	lea    0x0(%esi),%esi
{
80100420:	55                   	push   %ebp
80100421:	89 e5                	mov    %esp,%ebp
80100423:	57                   	push   %edi
80100424:	56                   	push   %esi
80100425:	53                   	push   %ebx
80100426:	89 c6                	mov    %eax,%esi
80100428:	83 ec 0c             	sub    $0xc,%esp
  if(c == BACKSPACE){
8010042b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100430:	0f 84 b1 00 00 00    	je     801004e7 <consputc+0xd7>
    uartputc(c);
80100436:	83 ec 0c             	sub    $0xc,%esp
80100439:	50                   	push   %eax
8010043a:	e8 c1 5a 00 00       	call   80105f00 <uartputc>
8010043f:	83 c4 10             	add    $0x10,%esp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100442:	bb d4 03 00 00       	mov    $0x3d4,%ebx
80100447:	b8 0e 00 00 00       	mov    $0xe,%eax
8010044c:	89 da                	mov    %ebx,%edx
8010044e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010044f:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
80100454:	89 ca                	mov    %ecx,%edx
80100456:	ec                   	in     (%dx),%al
  pos = inb(CRTPORT+1) << 8;
80100457:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010045a:	89 da                	mov    %ebx,%edx
8010045c:	c1 e0 08             	shl    $0x8,%eax
8010045f:	89 c7                	mov    %eax,%edi
80100461:	b8 0f 00 00 00       	mov    $0xf,%eax
80100466:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100467:	89 ca                	mov    %ecx,%edx
80100469:	ec                   	in     (%dx),%al
8010046a:	0f b6 d8             	movzbl %al,%ebx
  pos |= inb(CRTPORT+1);
8010046d:	09 fb                	or     %edi,%ebx
  if(c == '\n')
8010046f:	83 fe 0a             	cmp    $0xa,%esi
80100472:	0f 84 f3 00 00 00    	je     8010056b <consputc+0x15b>
  else if(c == BACKSPACE){
80100478:	81 fe 00 01 00 00    	cmp    $0x100,%esi
8010047e:	0f 84 d7 00 00 00    	je     8010055b <consputc+0x14b>
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
80100484:	89 f0                	mov    %esi,%eax
80100486:	0f b6 c0             	movzbl %al,%eax
80100489:	80 cc 07             	or     $0x7,%ah
8010048c:	66 89 84 1b 00 80 0b 	mov    %ax,-0x7ff48000(%ebx,%ebx,1)
80100493:	80 
80100494:	83 c3 01             	add    $0x1,%ebx
  if(pos < 0 || pos > 25*80)
80100497:	81 fb d0 07 00 00    	cmp    $0x7d0,%ebx
8010049d:	0f 8f ab 00 00 00    	jg     8010054e <consputc+0x13e>
  if((pos/80) >= 24){  // Scroll up.
801004a3:	81 fb 7f 07 00 00    	cmp    $0x77f,%ebx
801004a9:	7f 66                	jg     80100511 <consputc+0x101>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801004ab:	be d4 03 00 00       	mov    $0x3d4,%esi
801004b0:	b8 0e 00 00 00       	mov    $0xe,%eax
801004b5:	89 f2                	mov    %esi,%edx
801004b7:	ee                   	out    %al,(%dx)
801004b8:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
  outb(CRTPORT+1, pos>>8);
801004bd:	89 d8                	mov    %ebx,%eax
801004bf:	c1 f8 08             	sar    $0x8,%eax
801004c2:	89 ca                	mov    %ecx,%edx
801004c4:	ee                   	out    %al,(%dx)
801004c5:	b8 0f 00 00 00       	mov    $0xf,%eax
801004ca:	89 f2                	mov    %esi,%edx
801004cc:	ee                   	out    %al,(%dx)
801004cd:	89 d8                	mov    %ebx,%eax
801004cf:	89 ca                	mov    %ecx,%edx
801004d1:	ee                   	out    %al,(%dx)
  crt[pos] = ' ' | 0x0700;
801004d2:	b8 20 07 00 00       	mov    $0x720,%eax
801004d7:	66 89 84 1b 00 80 0b 	mov    %ax,-0x7ff48000(%ebx,%ebx,1)
801004de:	80 
}
801004df:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004e2:	5b                   	pop    %ebx
801004e3:	5e                   	pop    %esi
801004e4:	5f                   	pop    %edi
801004e5:	5d                   	pop    %ebp
801004e6:	c3                   	ret    
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004e7:	83 ec 0c             	sub    $0xc,%esp
801004ea:	6a 08                	push   $0x8
801004ec:	e8 0f 5a 00 00       	call   80105f00 <uartputc>
801004f1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004f8:	e8 03 5a 00 00       	call   80105f00 <uartputc>
801004fd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100504:	e8 f7 59 00 00       	call   80105f00 <uartputc>
80100509:	83 c4 10             	add    $0x10,%esp
8010050c:	e9 31 ff ff ff       	jmp    80100442 <consputc+0x32>
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100511:	52                   	push   %edx
80100512:	68 60 0e 00 00       	push   $0xe60
    pos -= 80;
80100517:	83 eb 50             	sub    $0x50,%ebx
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
8010051a:	68 a0 80 0b 80       	push   $0x800b80a0
8010051f:	68 00 80 0b 80       	push   $0x800b8000
80100524:	e8 67 40 00 00       	call   80104590 <memmove>
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100529:	b8 80 07 00 00       	mov    $0x780,%eax
8010052e:	83 c4 0c             	add    $0xc,%esp
80100531:	29 d8                	sub    %ebx,%eax
80100533:	01 c0                	add    %eax,%eax
80100535:	50                   	push   %eax
80100536:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
80100539:	6a 00                	push   $0x0
8010053b:	2d 00 80 f4 7f       	sub    $0x7ff48000,%eax
80100540:	50                   	push   %eax
80100541:	e8 9a 3f 00 00       	call   801044e0 <memset>
80100546:	83 c4 10             	add    $0x10,%esp
80100549:	e9 5d ff ff ff       	jmp    801004ab <consputc+0x9b>
    panic("pos under/overflow");
8010054e:	83 ec 0c             	sub    $0xc,%esp
80100551:	68 45 73 10 80       	push   $0x80107345
80100556:	e8 35 fe ff ff       	call   80100390 <panic>
    if(pos > 0) --pos;
8010055b:	85 db                	test   %ebx,%ebx
8010055d:	0f 84 48 ff ff ff    	je     801004ab <consputc+0x9b>
80100563:	83 eb 01             	sub    $0x1,%ebx
80100566:	e9 2c ff ff ff       	jmp    80100497 <consputc+0x87>
    pos += 80 - pos%80;
8010056b:	89 d8                	mov    %ebx,%eax
8010056d:	b9 50 00 00 00       	mov    $0x50,%ecx
80100572:	99                   	cltd   
80100573:	f7 f9                	idiv   %ecx
80100575:	29 d1                	sub    %edx,%ecx
80100577:	01 cb                	add    %ecx,%ebx
80100579:	e9 19 ff ff ff       	jmp    80100497 <consputc+0x87>
8010057e:	66 90                	xchg   %ax,%ax

80100580 <printint>:
{
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d3                	mov    %edx,%ebx
80100588:	83 ec 2c             	sub    $0x2c,%esp
  if(sign && (sign = xx < 0))
8010058b:	85 c9                	test   %ecx,%ecx
{
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  if(sign && (sign = xx < 0))
80100590:	74 04                	je     80100596 <printint+0x16>
80100592:	85 c0                	test   %eax,%eax
80100594:	78 5a                	js     801005f0 <printint+0x70>
    x = xx;
80100596:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  i = 0;
8010059d:	31 c9                	xor    %ecx,%ecx
8010059f:	8d 75 d7             	lea    -0x29(%ebp),%esi
801005a2:	eb 06                	jmp    801005aa <printint+0x2a>
801005a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    buf[i++] = digits[x % base];
801005a8:	89 f9                	mov    %edi,%ecx
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 79 01             	lea    0x1(%ecx),%edi
801005af:	f7 f3                	div    %ebx
801005b1:	0f b6 92 70 73 10 80 	movzbl -0x7fef8c90(%edx),%edx
  }while((x /= base) != 0);
801005b8:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
801005ba:	88 14 3e             	mov    %dl,(%esi,%edi,1)
  }while((x /= base) != 0);
801005bd:	75 e9                	jne    801005a8 <printint+0x28>
  if(sign)
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
    buf[i++] = '-';
801005c6:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
801005cb:	8d 79 02             	lea    0x2(%ecx),%edi
801005ce:	8d 5c 3d d7          	lea    -0x29(%ebp,%edi,1),%ebx
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    consputc(buf[i]);
801005d8:	0f be 03             	movsbl (%ebx),%eax
801005db:	83 eb 01             	sub    $0x1,%ebx
801005de:	e8 2d fe ff ff       	call   80100410 <consputc>
  while(--i >= 0)
801005e3:	39 f3                	cmp    %esi,%ebx
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
}
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
801005ef:	90                   	nop
    x = -xx;
801005f0:	f7 d8                	neg    %eax
801005f2:	eb a9                	jmp    8010059d <printint+0x1d>
801005f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80100600 <consolewrite>:

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
80100609:	8b 75 10             	mov    0x10(%ebp),%esi
  int i;

  iunlock(ip);
8010060c:	ff 75 08             	pushl  0x8(%ebp)
8010060f:	e8 5c 11 00 00       	call   80101770 <iunlock>
  acquire(&cons.lock);
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010061b:	e8 b0 3d 00 00       	call   801043d0 <acquire>
  for(i = 0; i < n; i++)
80100620:	83 c4 10             	add    $0x10,%esp
80100623:	85 f6                	test   %esi,%esi
80100625:	7e 18                	jle    8010063f <consolewrite+0x3f>
80100627:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010062a:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
    consputc(buf[i] & 0xff);
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 d5 fd ff ff       	call   80100410 <consputc>
  for(i = 0; i < n; i++)
8010063b:	39 fb                	cmp    %edi,%ebx
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
  release(&cons.lock);
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 a5 10 80       	push   $0x8010a520
80100647:	e8 44 3e 00 00       	call   80104490 <release>
  ilock(ip);
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 3b 10 00 00       	call   80101690 <ilock>

  return n;
}
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
{
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
  locking = cons.locking;
80100669:	a1 54 a5 10 80       	mov    0x8010a554,%eax
  if(locking)
8010066e:	85 c0                	test   %eax,%eax
  locking = cons.locking;
80100670:	89 45 dc             	mov    %eax,-0x24(%ebp)
  if(locking)
80100673:	0f 85 6f 01 00 00    	jne    801007e8 <cprintf+0x188>
  if (fmt == 0)
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c7                	mov    %eax,%edi
80100680:	0f 84 77 01 00 00    	je     801007fd <cprintf+0x19d>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100686:	0f b6 00             	movzbl (%eax),%eax
  argp = (uint*)(void*)(&fmt + 1);
80100689:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
8010068c:	31 db                	xor    %ebx,%ebx
  argp = (uint*)(void*)(&fmt + 1);
8010068e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100691:	85 c0                	test   %eax,%eax
80100693:	75 56                	jne    801006eb <cprintf+0x8b>
80100695:	eb 79                	jmp    80100710 <cprintf+0xb0>
80100697:	89 f6                	mov    %esi,%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[++i] & 0xff;
801006a0:	0f b6 16             	movzbl (%esi),%edx
    if(c == 0)
801006a3:	85 d2                	test   %edx,%edx
801006a5:	74 69                	je     80100710 <cprintf+0xb0>
801006a7:	83 c3 02             	add    $0x2,%ebx
    switch(c){
801006aa:	83 fa 70             	cmp    $0x70,%edx
801006ad:	8d 34 1f             	lea    (%edi,%ebx,1),%esi
801006b0:	0f 84 84 00 00 00    	je     8010073a <cprintf+0xda>
801006b6:	7f 78                	jg     80100730 <cprintf+0xd0>
801006b8:	83 fa 25             	cmp    $0x25,%edx
801006bb:	0f 84 ff 00 00 00    	je     801007c0 <cprintf+0x160>
801006c1:	83 fa 64             	cmp    $0x64,%edx
801006c4:	0f 85 8e 00 00 00    	jne    80100758 <cprintf+0xf8>
      printint(*argp++, 10, 1);
801006ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801006cd:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d2:	8d 48 04             	lea    0x4(%eax),%ecx
801006d5:	8b 00                	mov    (%eax),%eax
801006d7:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801006da:	b9 01 00 00 00       	mov    $0x1,%ecx
801006df:	e8 9c fe ff ff       	call   80100580 <printint>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006e4:	0f b6 06             	movzbl (%esi),%eax
801006e7:	85 c0                	test   %eax,%eax
801006e9:	74 25                	je     80100710 <cprintf+0xb0>
801006eb:	8d 53 01             	lea    0x1(%ebx),%edx
    if(c != '%'){
801006ee:	83 f8 25             	cmp    $0x25,%eax
801006f1:	8d 34 17             	lea    (%edi,%edx,1),%esi
801006f4:	74 aa                	je     801006a0 <cprintf+0x40>
801006f6:	89 55 e0             	mov    %edx,-0x20(%ebp)
      consputc(c);
801006f9:	e8 12 fd ff ff       	call   80100410 <consputc>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006fe:	0f b6 06             	movzbl (%esi),%eax
      continue;
80100701:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100704:	89 d3                	mov    %edx,%ebx
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100706:	85 c0                	test   %eax,%eax
80100708:	75 e1                	jne    801006eb <cprintf+0x8b>
8010070a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(locking)
80100710:	8b 45 dc             	mov    -0x24(%ebp),%eax
80100713:	85 c0                	test   %eax,%eax
80100715:	74 10                	je     80100727 <cprintf+0xc7>
    release(&cons.lock);
80100717:	83 ec 0c             	sub    $0xc,%esp
8010071a:	68 20 a5 10 80       	push   $0x8010a520
8010071f:	e8 6c 3d 00 00       	call   80104490 <release>
80100724:	83 c4 10             	add    $0x10,%esp
}
80100727:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010072a:	5b                   	pop    %ebx
8010072b:	5e                   	pop    %esi
8010072c:	5f                   	pop    %edi
8010072d:	5d                   	pop    %ebp
8010072e:	c3                   	ret    
8010072f:	90                   	nop
    switch(c){
80100730:	83 fa 73             	cmp    $0x73,%edx
80100733:	74 43                	je     80100778 <cprintf+0x118>
80100735:	83 fa 78             	cmp    $0x78,%edx
80100738:	75 1e                	jne    80100758 <cprintf+0xf8>
      printint(*argp++, 16, 0);
8010073a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010073d:	ba 10 00 00 00       	mov    $0x10,%edx
80100742:	8d 48 04             	lea    0x4(%eax),%ecx
80100745:	8b 00                	mov    (%eax),%eax
80100747:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010074a:	31 c9                	xor    %ecx,%ecx
8010074c:	e8 2f fe ff ff       	call   80100580 <printint>
      break;
80100751:	eb 91                	jmp    801006e4 <cprintf+0x84>
80100753:	90                   	nop
80100754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      consputc('%');
80100758:	b8 25 00 00 00       	mov    $0x25,%eax
8010075d:	89 55 e0             	mov    %edx,-0x20(%ebp)
80100760:	e8 ab fc ff ff       	call   80100410 <consputc>
      consputc(c);
80100765:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100768:	89 d0                	mov    %edx,%eax
8010076a:	e8 a1 fc ff ff       	call   80100410 <consputc>
      break;
8010076f:	e9 70 ff ff ff       	jmp    801006e4 <cprintf+0x84>
80100774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if((s = (char*)*argp++) == 0)
80100778:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010077b:	8b 10                	mov    (%eax),%edx
8010077d:	8d 48 04             	lea    0x4(%eax),%ecx
80100780:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80100783:	85 d2                	test   %edx,%edx
80100785:	74 49                	je     801007d0 <cprintf+0x170>
      for(; *s; s++)
80100787:	0f be 02             	movsbl (%edx),%eax
      if((s = (char*)*argp++) == 0)
8010078a:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
      for(; *s; s++)
8010078d:	84 c0                	test   %al,%al
8010078f:	0f 84 4f ff ff ff    	je     801006e4 <cprintf+0x84>
80100795:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80100798:	89 d3                	mov    %edx,%ebx
8010079a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801007a0:	83 c3 01             	add    $0x1,%ebx
        consputc(*s);
801007a3:	e8 68 fc ff ff       	call   80100410 <consputc>
      for(; *s; s++)
801007a8:	0f be 03             	movsbl (%ebx),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
      if((s = (char*)*argp++) == 0)
801007af:	8b 45 e0             	mov    -0x20(%ebp),%eax
801007b2:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801007b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801007b8:	e9 27 ff ff ff       	jmp    801006e4 <cprintf+0x84>
801007bd:	8d 76 00             	lea    0x0(%esi),%esi
      consputc('%');
801007c0:	b8 25 00 00 00       	mov    $0x25,%eax
801007c5:	e8 46 fc ff ff       	call   80100410 <consputc>
      break;
801007ca:	e9 15 ff ff ff       	jmp    801006e4 <cprintf+0x84>
801007cf:	90                   	nop
        s = "(null)";
801007d0:	ba 58 73 10 80       	mov    $0x80107358,%edx
      for(; *s; s++)
801007d5:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
801007d8:	b8 28 00 00 00       	mov    $0x28,%eax
801007dd:	89 d3                	mov    %edx,%ebx
801007df:	eb bf                	jmp    801007a0 <cprintf+0x140>
801007e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    acquire(&cons.lock);
801007e8:	83 ec 0c             	sub    $0xc,%esp
801007eb:	68 20 a5 10 80       	push   $0x8010a520
801007f0:	e8 db 3b 00 00       	call   801043d0 <acquire>
801007f5:	83 c4 10             	add    $0x10,%esp
801007f8:	e9 7c fe ff ff       	jmp    80100679 <cprintf+0x19>
    panic("null fmt");
801007fd:	83 ec 0c             	sub    $0xc,%esp
80100800:	68 5f 73 10 80       	push   $0x8010735f
80100805:	e8 86 fb ff ff       	call   80100390 <panic>
8010080a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100810 <consoleintr>:
{
80100810:	55                   	push   %ebp
80100811:	89 e5                	mov    %esp,%ebp
80100813:	57                   	push   %edi
80100814:	56                   	push   %esi
80100815:	53                   	push   %ebx
  int c, doprocdump = 0;
80100816:	31 f6                	xor    %esi,%esi
{
80100818:	83 ec 18             	sub    $0x18,%esp
8010081b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&cons.lock);
8010081e:	68 20 a5 10 80       	push   $0x8010a520
80100823:	e8 a8 3b 00 00       	call   801043d0 <acquire>
  while((c = getc()) >= 0){
80100828:	83 c4 10             	add    $0x10,%esp
8010082b:	90                   	nop
8010082c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100830:	ff d3                	call   *%ebx
80100832:	85 c0                	test   %eax,%eax
80100834:	89 c7                	mov    %eax,%edi
80100836:	78 48                	js     80100880 <consoleintr+0x70>
    switch(c){
80100838:	83 ff 10             	cmp    $0x10,%edi
8010083b:	0f 84 e7 00 00 00    	je     80100928 <consoleintr+0x118>
80100841:	7e 5d                	jle    801008a0 <consoleintr+0x90>
80100843:	83 ff 15             	cmp    $0x15,%edi
80100846:	0f 84 ec 00 00 00    	je     80100938 <consoleintr+0x128>
8010084c:	83 ff 7f             	cmp    $0x7f,%edi
8010084f:	75 54                	jne    801008a5 <consoleintr+0x95>
      if(input.e != input.w){
80100851:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100856:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
8010085c:	74 d2                	je     80100830 <consoleintr+0x20>
        input.e--;
8010085e:	83 e8 01             	sub    $0x1,%eax
80100861:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
        consputc(BACKSPACE);
80100866:	b8 00 01 00 00       	mov    $0x100,%eax
8010086b:	e8 a0 fb ff ff       	call   80100410 <consputc>
  while((c = getc()) >= 0){
80100870:	ff d3                	call   *%ebx
80100872:	85 c0                	test   %eax,%eax
80100874:	89 c7                	mov    %eax,%edi
80100876:	79 c0                	jns    80100838 <consoleintr+0x28>
80100878:	90                   	nop
80100879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  release(&cons.lock);
80100880:	83 ec 0c             	sub    $0xc,%esp
80100883:	68 20 a5 10 80       	push   $0x8010a520
80100888:	e8 03 3c 00 00       	call   80104490 <release>
  if(doprocdump) {
8010088d:	83 c4 10             	add    $0x10,%esp
80100890:	85 f6                	test   %esi,%esi
80100892:	0f 85 f8 00 00 00    	jne    80100990 <consoleintr+0x180>
}
80100898:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010089b:	5b                   	pop    %ebx
8010089c:	5e                   	pop    %esi
8010089d:	5f                   	pop    %edi
8010089e:	5d                   	pop    %ebp
8010089f:	c3                   	ret    
    switch(c){
801008a0:	83 ff 08             	cmp    $0x8,%edi
801008a3:	74 ac                	je     80100851 <consoleintr+0x41>
      if(c != 0 && input.e-input.r < INPUT_BUF){
801008a5:	85 ff                	test   %edi,%edi
801008a7:	74 87                	je     80100830 <consoleintr+0x20>
801008a9:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
801008ae:	89 c2                	mov    %eax,%edx
801008b0:	2b 15 a0 ff 10 80    	sub    0x8010ffa0,%edx
801008b6:	83 fa 7f             	cmp    $0x7f,%edx
801008b9:	0f 87 71 ff ff ff    	ja     80100830 <consoleintr+0x20>
801008bf:	8d 50 01             	lea    0x1(%eax),%edx
801008c2:	83 e0 7f             	and    $0x7f,%eax
        c = (c == '\r') ? '\n' : c;
801008c5:	83 ff 0d             	cmp    $0xd,%edi
        input.buf[input.e++ % INPUT_BUF] = c;
801008c8:	89 15 a8 ff 10 80    	mov    %edx,0x8010ffa8
        c = (c == '\r') ? '\n' : c;
801008ce:	0f 84 cc 00 00 00    	je     801009a0 <consoleintr+0x190>
        input.buf[input.e++ % INPUT_BUF] = c;
801008d4:	89 f9                	mov    %edi,%ecx
801008d6:	88 88 20 ff 10 80    	mov    %cl,-0x7fef00e0(%eax)
        consputc(c);
801008dc:	89 f8                	mov    %edi,%eax
801008de:	e8 2d fb ff ff       	call   80100410 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801008e3:	83 ff 0a             	cmp    $0xa,%edi
801008e6:	0f 84 c5 00 00 00    	je     801009b1 <consoleintr+0x1a1>
801008ec:	83 ff 04             	cmp    $0x4,%edi
801008ef:	0f 84 bc 00 00 00    	je     801009b1 <consoleintr+0x1a1>
801008f5:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801008fa:	83 e8 80             	sub    $0xffffff80,%eax
801008fd:	39 05 a8 ff 10 80    	cmp    %eax,0x8010ffa8
80100903:	0f 85 27 ff ff ff    	jne    80100830 <consoleintr+0x20>
          wakeup(&input.r);
80100909:	83 ec 0c             	sub    $0xc,%esp
          input.w = input.e;
8010090c:	a3 a4 ff 10 80       	mov    %eax,0x8010ffa4
          wakeup(&input.r);
80100911:	68 a0 ff 10 80       	push   $0x8010ffa0
80100916:	e8 95 36 00 00       	call   80103fb0 <wakeup>
8010091b:	83 c4 10             	add    $0x10,%esp
8010091e:	e9 0d ff ff ff       	jmp    80100830 <consoleintr+0x20>
80100923:	90                   	nop
80100924:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      doprocdump = 1;
80100928:	be 01 00 00 00       	mov    $0x1,%esi
8010092d:	e9 fe fe ff ff       	jmp    80100830 <consoleintr+0x20>
80100932:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      while(input.e != input.w &&
80100938:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
8010093d:	39 05 a4 ff 10 80    	cmp    %eax,0x8010ffa4
80100943:	75 2b                	jne    80100970 <consoleintr+0x160>
80100945:	e9 e6 fe ff ff       	jmp    80100830 <consoleintr+0x20>
8010094a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        input.e--;
80100950:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
        consputc(BACKSPACE);
80100955:	b8 00 01 00 00       	mov    $0x100,%eax
8010095a:	e8 b1 fa ff ff       	call   80100410 <consputc>
      while(input.e != input.w &&
8010095f:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100964:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
8010096a:	0f 84 c0 fe ff ff    	je     80100830 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100970:	83 e8 01             	sub    $0x1,%eax
80100973:	89 c2                	mov    %eax,%edx
80100975:	83 e2 7f             	and    $0x7f,%edx
      while(input.e != input.w &&
80100978:	80 ba 20 ff 10 80 0a 	cmpb   $0xa,-0x7fef00e0(%edx)
8010097f:	75 cf                	jne    80100950 <consoleintr+0x140>
80100981:	e9 aa fe ff ff       	jmp    80100830 <consoleintr+0x20>
80100986:	8d 76 00             	lea    0x0(%esi),%esi
80100989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
}
80100990:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100993:	5b                   	pop    %ebx
80100994:	5e                   	pop    %esi
80100995:	5f                   	pop    %edi
80100996:	5d                   	pop    %ebp
    procdump();  // now call procdump() wo. cons.lock held
80100997:	e9 f4 36 00 00       	jmp    80104090 <procdump>
8010099c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        input.buf[input.e++ % INPUT_BUF] = c;
801009a0:	c6 80 20 ff 10 80 0a 	movb   $0xa,-0x7fef00e0(%eax)
        consputc(c);
801009a7:	b8 0a 00 00 00       	mov    $0xa,%eax
801009ac:	e8 5f fa ff ff       	call   80100410 <consputc>
801009b1:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
801009b6:	e9 4e ff ff ff       	jmp    80100909 <consoleintr+0xf9>
801009bb:	90                   	nop
801009bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801009c0 <consoleinit>:

void
consoleinit(void)
{
801009c0:	55                   	push   %ebp
801009c1:	89 e5                	mov    %esp,%ebp
801009c3:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
801009c6:	68 68 73 10 80       	push   $0x80107368
801009cb:	68 20 a5 10 80       	push   $0x8010a520
801009d0:	e8 bb 38 00 00       	call   80104290 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  ioapicenable(IRQ_KBD, 0);
801009d5:	58                   	pop    %eax
801009d6:	5a                   	pop    %edx
801009d7:	6a 00                	push   $0x0
801009d9:	6a 01                	push   $0x1
  devsw[CONSOLE].write = consolewrite;
801009db:	c7 05 6c 09 11 80 00 	movl   $0x80100600,0x8011096c
801009e2:	06 10 80 
  devsw[CONSOLE].read = consoleread;
801009e5:	c7 05 68 09 11 80 70 	movl   $0x80100270,0x80110968
801009ec:	02 10 80 
  cons.locking = 1;
801009ef:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
801009f6:	00 00 00 
  ioapicenable(IRQ_KBD, 0);
801009f9:	e8 e2 18 00 00       	call   801022e0 <ioapicenable>
}
801009fe:	83 c4 10             	add    $0x10,%esp
80100a01:	c9                   	leave  
80100a02:	c3                   	ret    
80100a03:	66 90                	xchg   %ax,%ax
80100a05:	66 90                	xchg   %ax,%ax
80100a07:	66 90                	xchg   %ax,%ax
80100a09:	66 90                	xchg   %ax,%ax
80100a0b:	66 90                	xchg   %ax,%ax
80100a0d:	66 90                	xchg   %ax,%ax
80100a0f:	90                   	nop

80100a10 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
80100a10:	55                   	push   %ebp
80100a11:	89 e5                	mov    %esp,%ebp
80100a13:	57                   	push   %edi
80100a14:	56                   	push   %esi
80100a15:	53                   	push   %ebx
80100a16:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
80100a1c:	e8 2f 2e 00 00       	call   80103850 <myproc>
80100a21:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)

  begin_op();
80100a27:	e8 84 21 00 00       	call   80102bb0 <begin_op>

  if((ip = namei(path)) == 0){
80100a2c:	83 ec 0c             	sub    $0xc,%esp
80100a2f:	ff 75 08             	pushl  0x8(%ebp)
80100a32:	e8 b9 14 00 00       	call   80101ef0 <namei>
80100a37:	83 c4 10             	add    $0x10,%esp
80100a3a:	85 c0                	test   %eax,%eax
80100a3c:	0f 84 91 01 00 00    	je     80100bd3 <exec+0x1c3>
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
80100a42:	83 ec 0c             	sub    $0xc,%esp
80100a45:	89 c3                	mov    %eax,%ebx
80100a47:	50                   	push   %eax
80100a48:	e8 43 0c 00 00       	call   80101690 <ilock>
  pgdir = 0;
  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
80100a4d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a53:	6a 34                	push   $0x34
80100a55:	6a 00                	push   $0x0
80100a57:	50                   	push   %eax
80100a58:	53                   	push   %ebx
80100a59:	e8 12 0f 00 00       	call   80101970 <readi>
80100a5e:	83 c4 20             	add    $0x20,%esp
80100a61:	83 f8 34             	cmp    $0x34,%eax
80100a64:	74 22                	je     80100a88 <exec+0x78>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100a66:	83 ec 0c             	sub    $0xc,%esp
80100a69:	53                   	push   %ebx
80100a6a:	e8 b1 0e 00 00       	call   80101920 <iunlockput>
    end_op();
80100a6f:	e8 ac 21 00 00       	call   80102c20 <end_op>
80100a74:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100a77:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100a7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a7f:	5b                   	pop    %ebx
80100a80:	5e                   	pop    %esi
80100a81:	5f                   	pop    %edi
80100a82:	5d                   	pop    %ebp
80100a83:	c3                   	ret    
80100a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(elf.magic != ELF_MAGIC)
80100a88:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a8f:	45 4c 46 
80100a92:	75 d2                	jne    80100a66 <exec+0x56>
  if((pgdir = setupkvm()) == 0)
80100a94:	e8 a7 65 00 00       	call   80107040 <setupkvm>
80100a99:	85 c0                	test   %eax,%eax
80100a9b:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100aa1:	74 c3                	je     80100a66 <exec+0x56>
  sz = 0;
80100aa3:	31 ff                	xor    %edi,%edi
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100aa5:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100aac:	00 
80100aad:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
80100ab3:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100ab9:	0f 84 8c 02 00 00    	je     80100d4b <exec+0x33b>
80100abf:	31 f6                	xor    %esi,%esi
80100ac1:	eb 7f                	jmp    80100b42 <exec+0x132>
80100ac3:	90                   	nop
80100ac4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ph.type != ELF_PROG_LOAD)
80100ac8:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100acf:	75 63                	jne    80100b34 <exec+0x124>
    if(ph.memsz < ph.filesz)
80100ad1:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100ad7:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100add:	0f 82 86 00 00 00    	jb     80100b69 <exec+0x159>
80100ae3:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100ae9:	72 7e                	jb     80100b69 <exec+0x159>
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100aeb:	83 ec 04             	sub    $0x4,%esp
80100aee:	50                   	push   %eax
80100aef:	57                   	push   %edi
80100af0:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100af6:	e8 75 63 00 00       	call   80106e70 <allocuvm>
80100afb:	83 c4 10             	add    $0x10,%esp
80100afe:	85 c0                	test   %eax,%eax
80100b00:	89 c7                	mov    %eax,%edi
80100b02:	74 65                	je     80100b69 <exec+0x159>
    if(ph.vaddr % PGSIZE != 0)
80100b04:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b0a:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b0f:	75 58                	jne    80100b69 <exec+0x159>
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100b11:	83 ec 0c             	sub    $0xc,%esp
80100b14:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b1a:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b20:	53                   	push   %ebx
80100b21:	50                   	push   %eax
80100b22:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b28:	e8 83 62 00 00       	call   80106db0 <loaduvm>
80100b2d:	83 c4 20             	add    $0x20,%esp
80100b30:	85 c0                	test   %eax,%eax
80100b32:	78 35                	js     80100b69 <exec+0x159>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100b34:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100b3b:	83 c6 01             	add    $0x1,%esi
80100b3e:	39 f0                	cmp    %esi,%eax
80100b40:	7e 3d                	jle    80100b7f <exec+0x16f>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100b42:	89 f0                	mov    %esi,%eax
80100b44:	6a 20                	push   $0x20
80100b46:	c1 e0 05             	shl    $0x5,%eax
80100b49:	03 85 ec fe ff ff    	add    -0x114(%ebp),%eax
80100b4f:	50                   	push   %eax
80100b50:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100b56:	50                   	push   %eax
80100b57:	53                   	push   %ebx
80100b58:	e8 13 0e 00 00       	call   80101970 <readi>
80100b5d:	83 c4 10             	add    $0x10,%esp
80100b60:	83 f8 20             	cmp    $0x20,%eax
80100b63:	0f 84 5f ff ff ff    	je     80100ac8 <exec+0xb8>
    freevm(pgdir);
80100b69:	83 ec 0c             	sub    $0xc,%esp
80100b6c:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b72:	e8 49 64 00 00       	call   80106fc0 <freevm>
80100b77:	83 c4 10             	add    $0x10,%esp
80100b7a:	e9 e7 fe ff ff       	jmp    80100a66 <exec+0x56>
80100b7f:	81 c7 ff 0f 00 00    	add    $0xfff,%edi
80100b85:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80100b8b:	8d b7 00 20 00 00    	lea    0x2000(%edi),%esi
  iunlockput(ip);
80100b91:	83 ec 0c             	sub    $0xc,%esp
80100b94:	53                   	push   %ebx
80100b95:	e8 86 0d 00 00       	call   80101920 <iunlockput>
  end_op();
80100b9a:	e8 81 20 00 00       	call   80102c20 <end_op>
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b9f:	83 c4 0c             	add    $0xc,%esp
80100ba2:	56                   	push   %esi
80100ba3:	57                   	push   %edi
80100ba4:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100baa:	e8 c1 62 00 00       	call   80106e70 <allocuvm>
80100baf:	83 c4 10             	add    $0x10,%esp
80100bb2:	85 c0                	test   %eax,%eax
80100bb4:	89 c6                	mov    %eax,%esi
80100bb6:	75 3a                	jne    80100bf2 <exec+0x1e2>
    freevm(pgdir);
80100bb8:	83 ec 0c             	sub    $0xc,%esp
80100bbb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bc1:	e8 fa 63 00 00       	call   80106fc0 <freevm>
80100bc6:	83 c4 10             	add    $0x10,%esp
  return -1;
80100bc9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bce:	e9 a9 fe ff ff       	jmp    80100a7c <exec+0x6c>
    end_op();
80100bd3:	e8 48 20 00 00       	call   80102c20 <end_op>
    cprintf("exec: fail\n");
80100bd8:	83 ec 0c             	sub    $0xc,%esp
80100bdb:	68 81 73 10 80       	push   $0x80107381
80100be0:	e8 7b fa ff ff       	call   80100660 <cprintf>
    return -1;
80100be5:	83 c4 10             	add    $0x10,%esp
80100be8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bed:	e9 8a fe ff ff       	jmp    80100a7c <exec+0x6c>
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bf2:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100bf8:	83 ec 08             	sub    $0x8,%esp
  for(argc = 0; argv[argc]; argc++) {
80100bfb:	31 ff                	xor    %edi,%edi
80100bfd:	89 f3                	mov    %esi,%ebx
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bff:	50                   	push   %eax
80100c00:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c06:	e8 d5 64 00 00       	call   801070e0 <clearpteu>
  for(argc = 0; argv[argc]; argc++) {
80100c0b:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c0e:	83 c4 10             	add    $0x10,%esp
80100c11:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c17:	8b 00                	mov    (%eax),%eax
80100c19:	85 c0                	test   %eax,%eax
80100c1b:	74 70                	je     80100c8d <exec+0x27d>
80100c1d:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80100c23:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c29:	eb 0a                	jmp    80100c35 <exec+0x225>
80100c2b:	90                   	nop
80100c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(argc >= MAXARG)
80100c30:	83 ff 20             	cmp    $0x20,%edi
80100c33:	74 83                	je     80100bb8 <exec+0x1a8>
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c35:	83 ec 0c             	sub    $0xc,%esp
80100c38:	50                   	push   %eax
80100c39:	e8 c2 3a 00 00       	call   80104700 <strlen>
80100c3e:	f7 d0                	not    %eax
80100c40:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c42:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c45:	5a                   	pop    %edx
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c46:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c49:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c4c:	e8 af 3a 00 00       	call   80104700 <strlen>
80100c51:	83 c0 01             	add    $0x1,%eax
80100c54:	50                   	push   %eax
80100c55:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c58:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c5b:	53                   	push   %ebx
80100c5c:	56                   	push   %esi
80100c5d:	e8 ee 65 00 00       	call   80107250 <copyout>
80100c62:	83 c4 20             	add    $0x20,%esp
80100c65:	85 c0                	test   %eax,%eax
80100c67:	0f 88 4b ff ff ff    	js     80100bb8 <exec+0x1a8>
  for(argc = 0; argv[argc]; argc++) {
80100c6d:	8b 45 0c             	mov    0xc(%ebp),%eax
    ustack[3+argc] = sp;
80100c70:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
  for(argc = 0; argv[argc]; argc++) {
80100c77:	83 c7 01             	add    $0x1,%edi
    ustack[3+argc] = sp;
80100c7a:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
  for(argc = 0; argv[argc]; argc++) {
80100c80:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c83:	85 c0                	test   %eax,%eax
80100c85:	75 a9                	jne    80100c30 <exec+0x220>
80100c87:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c8d:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c94:	89 d9                	mov    %ebx,%ecx
  ustack[3+argc] = 0;
80100c96:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c9d:	00 00 00 00 
  ustack[0] = 0xffffffff;  // fake return PC
80100ca1:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100ca8:	ff ff ff 
  ustack[1] = argc;
80100cab:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100cb1:	29 c1                	sub    %eax,%ecx
  sp -= (3+argc+1) * 4;
80100cb3:	83 c0 0c             	add    $0xc,%eax
80100cb6:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cb8:	50                   	push   %eax
80100cb9:	52                   	push   %edx
80100cba:	53                   	push   %ebx
80100cbb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100cc1:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cc7:	e8 84 65 00 00       	call   80107250 <copyout>
80100ccc:	83 c4 10             	add    $0x10,%esp
80100ccf:	85 c0                	test   %eax,%eax
80100cd1:	0f 88 e1 fe ff ff    	js     80100bb8 <exec+0x1a8>
  for(last=s=path; *s; s++)
80100cd7:	8b 45 08             	mov    0x8(%ebp),%eax
80100cda:	0f b6 00             	movzbl (%eax),%eax
80100cdd:	84 c0                	test   %al,%al
80100cdf:	74 17                	je     80100cf8 <exec+0x2e8>
80100ce1:	8b 55 08             	mov    0x8(%ebp),%edx
80100ce4:	89 d1                	mov    %edx,%ecx
80100ce6:	83 c1 01             	add    $0x1,%ecx
80100ce9:	3c 2f                	cmp    $0x2f,%al
80100ceb:	0f b6 01             	movzbl (%ecx),%eax
80100cee:	0f 44 d1             	cmove  %ecx,%edx
80100cf1:	84 c0                	test   %al,%al
80100cf3:	75 f1                	jne    80100ce6 <exec+0x2d6>
80100cf5:	89 55 08             	mov    %edx,0x8(%ebp)
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100cf8:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100cfe:	50                   	push   %eax
80100cff:	6a 10                	push   $0x10
80100d01:	ff 75 08             	pushl  0x8(%ebp)
80100d04:	89 f8                	mov    %edi,%eax
80100d06:	83 c0 6c             	add    $0x6c,%eax
80100d09:	50                   	push   %eax
80100d0a:	e8 b1 39 00 00       	call   801046c0 <safestrcpy>
  curproc->pgdir = pgdir;
80100d0f:	8b 95 f0 fe ff ff    	mov    -0x110(%ebp),%edx
  oldpgdir = curproc->pgdir;
80100d15:	89 f9                	mov    %edi,%ecx
80100d17:	8b 7f 04             	mov    0x4(%edi),%edi
  curproc->tf->eip = elf.entry;  // main
80100d1a:	8b 41 18             	mov    0x18(%ecx),%eax
  curproc->sz = sz;
80100d1d:	89 31                	mov    %esi,(%ecx)
  curproc->pgdir = pgdir;
80100d1f:	89 51 04             	mov    %edx,0x4(%ecx)
  curproc->tf->eip = elf.entry;  // main
80100d22:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d28:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100d2b:	8b 41 18             	mov    0x18(%ecx),%eax
80100d2e:	89 58 44             	mov    %ebx,0x44(%eax)
  switchuvm(curproc);
80100d31:	89 0c 24             	mov    %ecx,(%esp)
80100d34:	e8 e7 5e 00 00       	call   80106c20 <switchuvm>
  freevm(oldpgdir);
80100d39:	89 3c 24             	mov    %edi,(%esp)
80100d3c:	e8 7f 62 00 00       	call   80106fc0 <freevm>
	return 0;
80100d41:	83 c4 10             	add    $0x10,%esp
80100d44:	31 c0                	xor    %eax,%eax
80100d46:	e9 31 fd ff ff       	jmp    80100a7c <exec+0x6c>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100d4b:	be 00 20 00 00       	mov    $0x2000,%esi
80100d50:	e9 3c fe ff ff       	jmp    80100b91 <exec+0x181>
80100d55:	66 90                	xchg   %ax,%ax
80100d57:	66 90                	xchg   %ax,%ax
80100d59:	66 90                	xchg   %ax,%ax
80100d5b:	66 90                	xchg   %ax,%ax
80100d5d:	66 90                	xchg   %ax,%ax
80100d5f:	90                   	nop

80100d60 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100d60:	55                   	push   %ebp
80100d61:	89 e5                	mov    %esp,%ebp
80100d63:	83 ec 10             	sub    $0x10,%esp
  initlock(&ftable.lock, "ftable");
80100d66:	68 8d 73 10 80       	push   $0x8010738d
80100d6b:	68 c0 ff 10 80       	push   $0x8010ffc0
80100d70:	e8 1b 35 00 00       	call   80104290 <initlock>
}
80100d75:	83 c4 10             	add    $0x10,%esp
80100d78:	c9                   	leave  
80100d79:	c3                   	ret    
80100d7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d80 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d80:	55                   	push   %ebp
80100d81:	89 e5                	mov    %esp,%ebp
80100d83:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d84:	bb f4 ff 10 80       	mov    $0x8010fff4,%ebx
{
80100d89:	83 ec 10             	sub    $0x10,%esp
  acquire(&ftable.lock);
80100d8c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100d91:	e8 3a 36 00 00       	call   801043d0 <acquire>
80100d96:	83 c4 10             	add    $0x10,%esp
80100d99:	eb 10                	jmp    80100dab <filealloc+0x2b>
80100d9b:	90                   	nop
80100d9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100da0:	83 c3 18             	add    $0x18,%ebx
80100da3:	81 fb 54 09 11 80    	cmp    $0x80110954,%ebx
80100da9:	73 25                	jae    80100dd0 <filealloc+0x50>
    if(f->ref == 0){
80100dab:	8b 43 04             	mov    0x4(%ebx),%eax
80100dae:	85 c0                	test   %eax,%eax
80100db0:	75 ee                	jne    80100da0 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100db2:	83 ec 0c             	sub    $0xc,%esp
      f->ref = 1;
80100db5:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100dbc:	68 c0 ff 10 80       	push   $0x8010ffc0
80100dc1:	e8 ca 36 00 00       	call   80104490 <release>
      return f;
    }
  }
  release(&ftable.lock);
  return 0;
}
80100dc6:	89 d8                	mov    %ebx,%eax
      return f;
80100dc8:	83 c4 10             	add    $0x10,%esp
}
80100dcb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dce:	c9                   	leave  
80100dcf:	c3                   	ret    
  release(&ftable.lock);
80100dd0:	83 ec 0c             	sub    $0xc,%esp
  return 0;
80100dd3:	31 db                	xor    %ebx,%ebx
  release(&ftable.lock);
80100dd5:	68 c0 ff 10 80       	push   $0x8010ffc0
80100dda:	e8 b1 36 00 00       	call   80104490 <release>
}
80100ddf:	89 d8                	mov    %ebx,%eax
  return 0;
80100de1:	83 c4 10             	add    $0x10,%esp
}
80100de4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100de7:	c9                   	leave  
80100de8:	c3                   	ret    
80100de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100df0 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100df0:	55                   	push   %ebp
80100df1:	89 e5                	mov    %esp,%ebp
80100df3:	53                   	push   %ebx
80100df4:	83 ec 10             	sub    $0x10,%esp
80100df7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100dfa:	68 c0 ff 10 80       	push   $0x8010ffc0
80100dff:	e8 cc 35 00 00       	call   801043d0 <acquire>
  if(f->ref < 1)
80100e04:	8b 43 04             	mov    0x4(%ebx),%eax
80100e07:	83 c4 10             	add    $0x10,%esp
80100e0a:	85 c0                	test   %eax,%eax
80100e0c:	7e 1a                	jle    80100e28 <filedup+0x38>
    panic("filedup");
  f->ref++;
80100e0e:	83 c0 01             	add    $0x1,%eax
  release(&ftable.lock);
80100e11:	83 ec 0c             	sub    $0xc,%esp
  f->ref++;
80100e14:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100e17:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e1c:	e8 6f 36 00 00       	call   80104490 <release>
  return f;
}
80100e21:	89 d8                	mov    %ebx,%eax
80100e23:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e26:	c9                   	leave  
80100e27:	c3                   	ret    
    panic("filedup");
80100e28:	83 ec 0c             	sub    $0xc,%esp
80100e2b:	68 94 73 10 80       	push   $0x80107394
80100e30:	e8 5b f5 ff ff       	call   80100390 <panic>
80100e35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e40 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100e40:	55                   	push   %ebp
80100e41:	89 e5                	mov    %esp,%ebp
80100e43:	57                   	push   %edi
80100e44:	56                   	push   %esi
80100e45:	53                   	push   %ebx
80100e46:	83 ec 28             	sub    $0x28,%esp
80100e49:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct file ff;

  acquire(&ftable.lock);
80100e4c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e51:	e8 7a 35 00 00       	call   801043d0 <acquire>
  if(f->ref < 1)
80100e56:	8b 43 04             	mov    0x4(%ebx),%eax
80100e59:	83 c4 10             	add    $0x10,%esp
80100e5c:	85 c0                	test   %eax,%eax
80100e5e:	0f 8e 9b 00 00 00    	jle    80100eff <fileclose+0xbf>
    panic("fileclose");
  if(--f->ref > 0){
80100e64:	83 e8 01             	sub    $0x1,%eax
80100e67:	85 c0                	test   %eax,%eax
80100e69:	89 43 04             	mov    %eax,0x4(%ebx)
80100e6c:	74 1a                	je     80100e88 <fileclose+0x48>
    release(&ftable.lock);
80100e6e:	c7 45 08 c0 ff 10 80 	movl   $0x8010ffc0,0x8(%ebp)
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e75:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e78:	5b                   	pop    %ebx
80100e79:	5e                   	pop    %esi
80100e7a:	5f                   	pop    %edi
80100e7b:	5d                   	pop    %ebp
    release(&ftable.lock);
80100e7c:	e9 0f 36 00 00       	jmp    80104490 <release>
80100e81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ff = *f;
80100e88:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
80100e8c:	8b 3b                	mov    (%ebx),%edi
  release(&ftable.lock);
80100e8e:	83 ec 0c             	sub    $0xc,%esp
  ff = *f;
80100e91:	8b 73 0c             	mov    0xc(%ebx),%esi
  f->type = FD_NONE;
80100e94:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  ff = *f;
80100e9a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e9d:	8b 43 10             	mov    0x10(%ebx),%eax
  release(&ftable.lock);
80100ea0:	68 c0 ff 10 80       	push   $0x8010ffc0
  ff = *f;
80100ea5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  release(&ftable.lock);
80100ea8:	e8 e3 35 00 00       	call   80104490 <release>
  if(ff.type == FD_PIPE)
80100ead:	83 c4 10             	add    $0x10,%esp
80100eb0:	83 ff 01             	cmp    $0x1,%edi
80100eb3:	74 13                	je     80100ec8 <fileclose+0x88>
  else if(ff.type == FD_INODE){
80100eb5:	83 ff 02             	cmp    $0x2,%edi
80100eb8:	74 26                	je     80100ee0 <fileclose+0xa0>
}
80100eba:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ebd:	5b                   	pop    %ebx
80100ebe:	5e                   	pop    %esi
80100ebf:	5f                   	pop    %edi
80100ec0:	5d                   	pop    %ebp
80100ec1:	c3                   	ret    
80100ec2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pipeclose(ff.pipe, ff.writable);
80100ec8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100ecc:	83 ec 08             	sub    $0x8,%esp
80100ecf:	53                   	push   %ebx
80100ed0:	56                   	push   %esi
80100ed1:	e8 8a 24 00 00       	call   80103360 <pipeclose>
80100ed6:	83 c4 10             	add    $0x10,%esp
80100ed9:	eb df                	jmp    80100eba <fileclose+0x7a>
80100edb:	90                   	nop
80100edc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    begin_op();
80100ee0:	e8 cb 1c 00 00       	call   80102bb0 <begin_op>
    iput(ff.ip);
80100ee5:	83 ec 0c             	sub    $0xc,%esp
80100ee8:	ff 75 e0             	pushl  -0x20(%ebp)
80100eeb:	e8 d0 08 00 00       	call   801017c0 <iput>
    end_op();
80100ef0:	83 c4 10             	add    $0x10,%esp
}
80100ef3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ef6:	5b                   	pop    %ebx
80100ef7:	5e                   	pop    %esi
80100ef8:	5f                   	pop    %edi
80100ef9:	5d                   	pop    %ebp
    end_op();
80100efa:	e9 21 1d 00 00       	jmp    80102c20 <end_op>
    panic("fileclose");
80100eff:	83 ec 0c             	sub    $0xc,%esp
80100f02:	68 9c 73 10 80       	push   $0x8010739c
80100f07:	e8 84 f4 ff ff       	call   80100390 <panic>
80100f0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f10 <filestat>:

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100f10:	55                   	push   %ebp
80100f11:	89 e5                	mov    %esp,%ebp
80100f13:	53                   	push   %ebx
80100f14:	83 ec 04             	sub    $0x4,%esp
80100f17:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100f1a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f1d:	75 31                	jne    80100f50 <filestat+0x40>
    ilock(f->ip);
80100f1f:	83 ec 0c             	sub    $0xc,%esp
80100f22:	ff 73 10             	pushl  0x10(%ebx)
80100f25:	e8 66 07 00 00       	call   80101690 <ilock>
    stati(f->ip, st);
80100f2a:	58                   	pop    %eax
80100f2b:	5a                   	pop    %edx
80100f2c:	ff 75 0c             	pushl  0xc(%ebp)
80100f2f:	ff 73 10             	pushl  0x10(%ebx)
80100f32:	e8 09 0a 00 00       	call   80101940 <stati>
    iunlock(f->ip);
80100f37:	59                   	pop    %ecx
80100f38:	ff 73 10             	pushl  0x10(%ebx)
80100f3b:	e8 30 08 00 00       	call   80101770 <iunlock>
    return 0;
80100f40:	83 c4 10             	add    $0x10,%esp
80100f43:	31 c0                	xor    %eax,%eax
  }
  return -1;
}
80100f45:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f48:	c9                   	leave  
80100f49:	c3                   	ret    
80100f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  return -1;
80100f50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f55:	eb ee                	jmp    80100f45 <filestat+0x35>
80100f57:	89 f6                	mov    %esi,%esi
80100f59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100f60 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100f60:	55                   	push   %ebp
80100f61:	89 e5                	mov    %esp,%ebp
80100f63:	57                   	push   %edi
80100f64:	56                   	push   %esi
80100f65:	53                   	push   %ebx
80100f66:	83 ec 0c             	sub    $0xc,%esp
80100f69:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f6c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f6f:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100f72:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f76:	74 60                	je     80100fd8 <fileread+0x78>
    return -1;
  if(f->type == FD_PIPE)
80100f78:	8b 03                	mov    (%ebx),%eax
80100f7a:	83 f8 01             	cmp    $0x1,%eax
80100f7d:	74 41                	je     80100fc0 <fileread+0x60>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100f7f:	83 f8 02             	cmp    $0x2,%eax
80100f82:	75 5b                	jne    80100fdf <fileread+0x7f>
    ilock(f->ip);
80100f84:	83 ec 0c             	sub    $0xc,%esp
80100f87:	ff 73 10             	pushl  0x10(%ebx)
80100f8a:	e8 01 07 00 00       	call   80101690 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f8f:	57                   	push   %edi
80100f90:	ff 73 14             	pushl  0x14(%ebx)
80100f93:	56                   	push   %esi
80100f94:	ff 73 10             	pushl  0x10(%ebx)
80100f97:	e8 d4 09 00 00       	call   80101970 <readi>
80100f9c:	83 c4 20             	add    $0x20,%esp
80100f9f:	85 c0                	test   %eax,%eax
80100fa1:	89 c6                	mov    %eax,%esi
80100fa3:	7e 03                	jle    80100fa8 <fileread+0x48>
      f->off += r;
80100fa5:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80100fa8:	83 ec 0c             	sub    $0xc,%esp
80100fab:	ff 73 10             	pushl  0x10(%ebx)
80100fae:	e8 bd 07 00 00       	call   80101770 <iunlock>
    return r;
80100fb3:	83 c4 10             	add    $0x10,%esp
  }
  panic("fileread");
}
80100fb6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fb9:	89 f0                	mov    %esi,%eax
80100fbb:	5b                   	pop    %ebx
80100fbc:	5e                   	pop    %esi
80100fbd:	5f                   	pop    %edi
80100fbe:	5d                   	pop    %ebp
80100fbf:	c3                   	ret    
    return piperead(f->pipe, addr, n);
80100fc0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fc3:	89 45 08             	mov    %eax,0x8(%ebp)
}
80100fc6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fc9:	5b                   	pop    %ebx
80100fca:	5e                   	pop    %esi
80100fcb:	5f                   	pop    %edi
80100fcc:	5d                   	pop    %ebp
    return piperead(f->pipe, addr, n);
80100fcd:	e9 3e 25 00 00       	jmp    80103510 <piperead>
80100fd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80100fd8:	be ff ff ff ff       	mov    $0xffffffff,%esi
80100fdd:	eb d7                	jmp    80100fb6 <fileread+0x56>
  panic("fileread");
80100fdf:	83 ec 0c             	sub    $0xc,%esp
80100fe2:	68 a6 73 10 80       	push   $0x801073a6
80100fe7:	e8 a4 f3 ff ff       	call   80100390 <panic>
80100fec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100ff0 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100ff0:	55                   	push   %ebp
80100ff1:	89 e5                	mov    %esp,%ebp
80100ff3:	57                   	push   %edi
80100ff4:	56                   	push   %esi
80100ff5:	53                   	push   %ebx
80100ff6:	83 ec 1c             	sub    $0x1c,%esp
80100ff9:	8b 75 08             	mov    0x8(%ebp),%esi
80100ffc:	8b 45 0c             	mov    0xc(%ebp),%eax
  int r;

  if(f->writable == 0)
80100fff:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
{
80101003:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101006:	8b 45 10             	mov    0x10(%ebp),%eax
80101009:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(f->writable == 0)
8010100c:	0f 84 aa 00 00 00    	je     801010bc <filewrite+0xcc>
    return -1;
  if(f->type == FD_PIPE)
80101012:	8b 06                	mov    (%esi),%eax
80101014:	83 f8 01             	cmp    $0x1,%eax
80101017:	0f 84 c3 00 00 00    	je     801010e0 <filewrite+0xf0>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
8010101d:	83 f8 02             	cmp    $0x2,%eax
80101020:	0f 85 d9 00 00 00    	jne    801010ff <filewrite+0x10f>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80101026:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    int i = 0;
80101029:	31 ff                	xor    %edi,%edi
    while(i < n){
8010102b:	85 c0                	test   %eax,%eax
8010102d:	7f 34                	jg     80101063 <filewrite+0x73>
8010102f:	e9 9c 00 00 00       	jmp    801010d0 <filewrite+0xe0>
80101034:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101038:	01 46 14             	add    %eax,0x14(%esi)
      iunlock(f->ip);
8010103b:	83 ec 0c             	sub    $0xc,%esp
8010103e:	ff 76 10             	pushl  0x10(%esi)
        f->off += r;
80101041:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
80101044:	e8 27 07 00 00       	call   80101770 <iunlock>
      end_op();
80101049:	e8 d2 1b 00 00       	call   80102c20 <end_op>
8010104e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101051:	83 c4 10             	add    $0x10,%esp

      if(r < 0)
        break;
      if(r != n1)
80101054:	39 c3                	cmp    %eax,%ebx
80101056:	0f 85 96 00 00 00    	jne    801010f2 <filewrite+0x102>
        panic("short filewrite");
      i += r;
8010105c:	01 df                	add    %ebx,%edi
    while(i < n){
8010105e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101061:	7e 6d                	jle    801010d0 <filewrite+0xe0>
      int n1 = n - i;
80101063:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101066:	b8 00 06 00 00       	mov    $0x600,%eax
8010106b:	29 fb                	sub    %edi,%ebx
8010106d:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
80101073:	0f 4f d8             	cmovg  %eax,%ebx
      begin_op();
80101076:	e8 35 1b 00 00       	call   80102bb0 <begin_op>
      ilock(f->ip);
8010107b:	83 ec 0c             	sub    $0xc,%esp
8010107e:	ff 76 10             	pushl  0x10(%esi)
80101081:	e8 0a 06 00 00       	call   80101690 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
80101086:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101089:	53                   	push   %ebx
8010108a:	ff 76 14             	pushl  0x14(%esi)
8010108d:	01 f8                	add    %edi,%eax
8010108f:	50                   	push   %eax
80101090:	ff 76 10             	pushl  0x10(%esi)
80101093:	e8 d8 09 00 00       	call   80101a70 <writei>
80101098:	83 c4 20             	add    $0x20,%esp
8010109b:	85 c0                	test   %eax,%eax
8010109d:	7f 99                	jg     80101038 <filewrite+0x48>
      iunlock(f->ip);
8010109f:	83 ec 0c             	sub    $0xc,%esp
801010a2:	ff 76 10             	pushl  0x10(%esi)
801010a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
801010a8:	e8 c3 06 00 00       	call   80101770 <iunlock>
      end_op();
801010ad:	e8 6e 1b 00 00       	call   80102c20 <end_op>
      if(r < 0)
801010b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010b5:	83 c4 10             	add    $0x10,%esp
801010b8:	85 c0                	test   %eax,%eax
801010ba:	74 98                	je     80101054 <filewrite+0x64>
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
801010bf:	bf ff ff ff ff       	mov    $0xffffffff,%edi
}
801010c4:	89 f8                	mov    %edi,%eax
801010c6:	5b                   	pop    %ebx
801010c7:	5e                   	pop    %esi
801010c8:	5f                   	pop    %edi
801010c9:	5d                   	pop    %ebp
801010ca:	c3                   	ret    
801010cb:	90                   	nop
801010cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return i == n ? n : -1;
801010d0:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801010d3:	75 e7                	jne    801010bc <filewrite+0xcc>
}
801010d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010d8:	89 f8                	mov    %edi,%eax
801010da:	5b                   	pop    %ebx
801010db:	5e                   	pop    %esi
801010dc:	5f                   	pop    %edi
801010dd:	5d                   	pop    %ebp
801010de:	c3                   	ret    
801010df:	90                   	nop
    return pipewrite(f->pipe, addr, n);
801010e0:	8b 46 0c             	mov    0xc(%esi),%eax
801010e3:	89 45 08             	mov    %eax,0x8(%ebp)
}
801010e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010e9:	5b                   	pop    %ebx
801010ea:	5e                   	pop    %esi
801010eb:	5f                   	pop    %edi
801010ec:	5d                   	pop    %ebp
    return pipewrite(f->pipe, addr, n);
801010ed:	e9 0e 23 00 00       	jmp    80103400 <pipewrite>
        panic("short filewrite");
801010f2:	83 ec 0c             	sub    $0xc,%esp
801010f5:	68 af 73 10 80       	push   $0x801073af
801010fa:	e8 91 f2 ff ff       	call   80100390 <panic>
  panic("filewrite");
801010ff:	83 ec 0c             	sub    $0xc,%esp
80101102:	68 b5 73 10 80       	push   $0x801073b5
80101107:	e8 84 f2 ff ff       	call   80100390 <panic>
8010110c:	66 90                	xchg   %ax,%ax
8010110e:	66 90                	xchg   %ax,%ax

80101110 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
80101110:	55                   	push   %ebp
80101111:	89 e5                	mov    %esp,%ebp
80101113:	57                   	push   %edi
80101114:	56                   	push   %esi
80101115:	53                   	push   %ebx
80101116:	83 ec 1c             	sub    $0x1c,%esp
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
80101119:	8b 0d c0 09 11 80    	mov    0x801109c0,%ecx
{
8010111f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  for(b = 0; b < sb.size; b += BPB){
80101122:	85 c9                	test   %ecx,%ecx
80101124:	0f 84 87 00 00 00    	je     801011b1 <balloc+0xa1>
8010112a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
80101131:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101134:	83 ec 08             	sub    $0x8,%esp
80101137:	89 f0                	mov    %esi,%eax
80101139:	c1 f8 0c             	sar    $0xc,%eax
8010113c:	03 05 d8 09 11 80    	add    0x801109d8,%eax
80101142:	50                   	push   %eax
80101143:	ff 75 d8             	pushl  -0x28(%ebp)
80101146:	e8 85 ef ff ff       	call   801000d0 <bread>
8010114b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
8010114e:	a1 c0 09 11 80       	mov    0x801109c0,%eax
80101153:	83 c4 10             	add    $0x10,%esp
80101156:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101159:	31 c0                	xor    %eax,%eax
8010115b:	eb 2f                	jmp    8010118c <balloc+0x7c>
8010115d:	8d 76 00             	lea    0x0(%esi),%esi
      m = 1 << (bi % 8);
80101160:	89 c1                	mov    %eax,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101162:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      m = 1 << (bi % 8);
80101165:	bb 01 00 00 00       	mov    $0x1,%ebx
8010116a:	83 e1 07             	and    $0x7,%ecx
8010116d:	d3 e3                	shl    %cl,%ebx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010116f:	89 c1                	mov    %eax,%ecx
80101171:	c1 f9 03             	sar    $0x3,%ecx
80101174:	0f b6 7c 0a 5c       	movzbl 0x5c(%edx,%ecx,1),%edi
80101179:	85 df                	test   %ebx,%edi
8010117b:	89 fa                	mov    %edi,%edx
8010117d:	74 41                	je     801011c0 <balloc+0xb0>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
8010117f:	83 c0 01             	add    $0x1,%eax
80101182:	83 c6 01             	add    $0x1,%esi
80101185:	3d 00 10 00 00       	cmp    $0x1000,%eax
8010118a:	74 05                	je     80101191 <balloc+0x81>
8010118c:	39 75 e0             	cmp    %esi,-0x20(%ebp)
8010118f:	77 cf                	ja     80101160 <balloc+0x50>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
80101191:	83 ec 0c             	sub    $0xc,%esp
80101194:	ff 75 e4             	pushl  -0x1c(%ebp)
80101197:	e8 44 f0 ff ff       	call   801001e0 <brelse>
  for(b = 0; b < sb.size; b += BPB){
8010119c:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
801011a3:	83 c4 10             	add    $0x10,%esp
801011a6:	8b 45 dc             	mov    -0x24(%ebp),%eax
801011a9:	39 05 c0 09 11 80    	cmp    %eax,0x801109c0
801011af:	77 80                	ja     80101131 <balloc+0x21>
  }
  panic("balloc: out of blocks");
801011b1:	83 ec 0c             	sub    $0xc,%esp
801011b4:	68 bf 73 10 80       	push   $0x801073bf
801011b9:	e8 d2 f1 ff ff       	call   80100390 <panic>
801011be:	66 90                	xchg   %ax,%ax
        bp->data[bi/8] |= m;  // Mark block in use.
801011c0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
        log_write(bp);
801011c3:	83 ec 0c             	sub    $0xc,%esp
        bp->data[bi/8] |= m;  // Mark block in use.
801011c6:	09 da                	or     %ebx,%edx
801011c8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
        log_write(bp);
801011cc:	57                   	push   %edi
801011cd:	e8 ae 1b 00 00       	call   80102d80 <log_write>
        brelse(bp);
801011d2:	89 3c 24             	mov    %edi,(%esp)
801011d5:	e8 06 f0 ff ff       	call   801001e0 <brelse>
  bp = bread(dev, bno);
801011da:	58                   	pop    %eax
801011db:	5a                   	pop    %edx
801011dc:	56                   	push   %esi
801011dd:	ff 75 d8             	pushl  -0x28(%ebp)
801011e0:	e8 eb ee ff ff       	call   801000d0 <bread>
801011e5:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
801011e7:	8d 40 5c             	lea    0x5c(%eax),%eax
801011ea:	83 c4 0c             	add    $0xc,%esp
801011ed:	68 00 02 00 00       	push   $0x200
801011f2:	6a 00                	push   $0x0
801011f4:	50                   	push   %eax
801011f5:	e8 e6 32 00 00       	call   801044e0 <memset>
  log_write(bp);
801011fa:	89 1c 24             	mov    %ebx,(%esp)
801011fd:	e8 7e 1b 00 00       	call   80102d80 <log_write>
  brelse(bp);
80101202:	89 1c 24             	mov    %ebx,(%esp)
80101205:	e8 d6 ef ff ff       	call   801001e0 <brelse>
}
8010120a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010120d:	89 f0                	mov    %esi,%eax
8010120f:	5b                   	pop    %ebx
80101210:	5e                   	pop    %esi
80101211:	5f                   	pop    %edi
80101212:	5d                   	pop    %ebp
80101213:	c3                   	ret    
80101214:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010121a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101220 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101220:	55                   	push   %ebp
80101221:	89 e5                	mov    %esp,%ebp
80101223:	57                   	push   %edi
80101224:	56                   	push   %esi
80101225:	53                   	push   %ebx
80101226:	89 c7                	mov    %eax,%edi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
80101228:	31 f6                	xor    %esi,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010122a:	bb 14 0a 11 80       	mov    $0x80110a14,%ebx
{
8010122f:	83 ec 28             	sub    $0x28,%esp
80101232:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  acquire(&icache.lock);
80101235:	68 e0 09 11 80       	push   $0x801109e0
8010123a:	e8 91 31 00 00       	call   801043d0 <acquire>
8010123f:	83 c4 10             	add    $0x10,%esp
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101242:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101245:	eb 17                	jmp    8010125e <iget+0x3e>
80101247:	89 f6                	mov    %esi,%esi
80101249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101250:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101256:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
8010125c:	73 22                	jae    80101280 <iget+0x60>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
8010125e:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101261:	85 c9                	test   %ecx,%ecx
80101263:	7e 04                	jle    80101269 <iget+0x49>
80101265:	39 3b                	cmp    %edi,(%ebx)
80101267:	74 4f                	je     801012b8 <iget+0x98>
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101269:	85 f6                	test   %esi,%esi
8010126b:	75 e3                	jne    80101250 <iget+0x30>
8010126d:	85 c9                	test   %ecx,%ecx
8010126f:	0f 44 f3             	cmove  %ebx,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101272:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101278:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
8010127e:	72 de                	jb     8010125e <iget+0x3e>
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
80101280:	85 f6                	test   %esi,%esi
80101282:	74 5b                	je     801012df <iget+0xbf>
  ip = empty;
  ip->dev = dev;
  ip->inum = inum;
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);
80101284:	83 ec 0c             	sub    $0xc,%esp
  ip->dev = dev;
80101287:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
80101289:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
8010128c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->valid = 0;
80101293:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
8010129a:	68 e0 09 11 80       	push   $0x801109e0
8010129f:	e8 ec 31 00 00       	call   80104490 <release>

  return ip;
801012a4:	83 c4 10             	add    $0x10,%esp
}
801012a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012aa:	89 f0                	mov    %esi,%eax
801012ac:	5b                   	pop    %ebx
801012ad:	5e                   	pop    %esi
801012ae:	5f                   	pop    %edi
801012af:	5d                   	pop    %ebp
801012b0:	c3                   	ret    
801012b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
801012b8:	39 53 04             	cmp    %edx,0x4(%ebx)
801012bb:	75 ac                	jne    80101269 <iget+0x49>
      release(&icache.lock);
801012bd:	83 ec 0c             	sub    $0xc,%esp
      ip->ref++;
801012c0:	83 c1 01             	add    $0x1,%ecx
      return ip;
801012c3:	89 de                	mov    %ebx,%esi
      release(&icache.lock);
801012c5:	68 e0 09 11 80       	push   $0x801109e0
      ip->ref++;
801012ca:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
801012cd:	e8 be 31 00 00       	call   80104490 <release>
      return ip;
801012d2:	83 c4 10             	add    $0x10,%esp
}
801012d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012d8:	89 f0                	mov    %esi,%eax
801012da:	5b                   	pop    %ebx
801012db:	5e                   	pop    %esi
801012dc:	5f                   	pop    %edi
801012dd:	5d                   	pop    %ebp
801012de:	c3                   	ret    
    panic("iget: no inodes");
801012df:	83 ec 0c             	sub    $0xc,%esp
801012e2:	68 d5 73 10 80       	push   $0x801073d5
801012e7:	e8 a4 f0 ff ff       	call   80100390 <panic>
801012ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801012f0 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
801012f0:	55                   	push   %ebp
801012f1:	89 e5                	mov    %esp,%ebp
801012f3:	57                   	push   %edi
801012f4:	56                   	push   %esi
801012f5:	53                   	push   %ebx
801012f6:	89 c6                	mov    %eax,%esi
801012f8:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
801012fb:	83 fa 0b             	cmp    $0xb,%edx
801012fe:	77 18                	ja     80101318 <bmap+0x28>
80101300:	8d 3c 90             	lea    (%eax,%edx,4),%edi
    if((addr = ip->addrs[bn]) == 0)
80101303:	8b 5f 5c             	mov    0x5c(%edi),%ebx
80101306:	85 db                	test   %ebx,%ebx
80101308:	74 76                	je     80101380 <bmap+0x90>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
8010130a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010130d:	89 d8                	mov    %ebx,%eax
8010130f:	5b                   	pop    %ebx
80101310:	5e                   	pop    %esi
80101311:	5f                   	pop    %edi
80101312:	5d                   	pop    %ebp
80101313:	c3                   	ret    
80101314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bn -= NDIRECT;
80101318:	8d 5a f4             	lea    -0xc(%edx),%ebx
  if(bn < NINDIRECT){
8010131b:	83 fb 7f             	cmp    $0x7f,%ebx
8010131e:	0f 87 90 00 00 00    	ja     801013b4 <bmap+0xc4>
    if((addr = ip->addrs[NDIRECT]) == 0)
80101324:	8b 90 8c 00 00 00    	mov    0x8c(%eax),%edx
8010132a:	8b 00                	mov    (%eax),%eax
8010132c:	85 d2                	test   %edx,%edx
8010132e:	74 70                	je     801013a0 <bmap+0xb0>
    bp = bread(ip->dev, addr);
80101330:	83 ec 08             	sub    $0x8,%esp
80101333:	52                   	push   %edx
80101334:	50                   	push   %eax
80101335:	e8 96 ed ff ff       	call   801000d0 <bread>
    if((addr = a[bn]) == 0){
8010133a:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010133e:	83 c4 10             	add    $0x10,%esp
    bp = bread(ip->dev, addr);
80101341:	89 c7                	mov    %eax,%edi
    if((addr = a[bn]) == 0){
80101343:	8b 1a                	mov    (%edx),%ebx
80101345:	85 db                	test   %ebx,%ebx
80101347:	75 1d                	jne    80101366 <bmap+0x76>
      a[bn] = addr = balloc(ip->dev);
80101349:	8b 06                	mov    (%esi),%eax
8010134b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010134e:	e8 bd fd ff ff       	call   80101110 <balloc>
80101353:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      log_write(bp);
80101356:	83 ec 0c             	sub    $0xc,%esp
      a[bn] = addr = balloc(ip->dev);
80101359:	89 c3                	mov    %eax,%ebx
8010135b:	89 02                	mov    %eax,(%edx)
      log_write(bp);
8010135d:	57                   	push   %edi
8010135e:	e8 1d 1a 00 00       	call   80102d80 <log_write>
80101363:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
80101366:	83 ec 0c             	sub    $0xc,%esp
80101369:	57                   	push   %edi
8010136a:	e8 71 ee ff ff       	call   801001e0 <brelse>
8010136f:	83 c4 10             	add    $0x10,%esp
}
80101372:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101375:	89 d8                	mov    %ebx,%eax
80101377:	5b                   	pop    %ebx
80101378:	5e                   	pop    %esi
80101379:	5f                   	pop    %edi
8010137a:	5d                   	pop    %ebp
8010137b:	c3                   	ret    
8010137c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      ip->addrs[bn] = addr = balloc(ip->dev);
80101380:	8b 00                	mov    (%eax),%eax
80101382:	e8 89 fd ff ff       	call   80101110 <balloc>
80101387:	89 47 5c             	mov    %eax,0x5c(%edi)
}
8010138a:	8d 65 f4             	lea    -0xc(%ebp),%esp
      ip->addrs[bn] = addr = balloc(ip->dev);
8010138d:	89 c3                	mov    %eax,%ebx
}
8010138f:	89 d8                	mov    %ebx,%eax
80101391:	5b                   	pop    %ebx
80101392:	5e                   	pop    %esi
80101393:	5f                   	pop    %edi
80101394:	5d                   	pop    %ebp
80101395:	c3                   	ret    
80101396:	8d 76 00             	lea    0x0(%esi),%esi
80101399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
801013a0:	e8 6b fd ff ff       	call   80101110 <balloc>
801013a5:	89 c2                	mov    %eax,%edx
801013a7:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
801013ad:	8b 06                	mov    (%esi),%eax
801013af:	e9 7c ff ff ff       	jmp    80101330 <bmap+0x40>
  panic("bmap: out of range");
801013b4:	83 ec 0c             	sub    $0xc,%esp
801013b7:	68 e5 73 10 80       	push   $0x801073e5
801013bc:	e8 cf ef ff ff       	call   80100390 <panic>
801013c1:	eb 0d                	jmp    801013d0 <readsb>
801013c3:	90                   	nop
801013c4:	90                   	nop
801013c5:	90                   	nop
801013c6:	90                   	nop
801013c7:	90                   	nop
801013c8:	90                   	nop
801013c9:	90                   	nop
801013ca:	90                   	nop
801013cb:	90                   	nop
801013cc:	90                   	nop
801013cd:	90                   	nop
801013ce:	90                   	nop
801013cf:	90                   	nop

801013d0 <readsb>:
{
801013d0:	55                   	push   %ebp
801013d1:	89 e5                	mov    %esp,%ebp
801013d3:	56                   	push   %esi
801013d4:	53                   	push   %ebx
801013d5:	8b 75 0c             	mov    0xc(%ebp),%esi
  bp = bread(dev, 1);
801013d8:	83 ec 08             	sub    $0x8,%esp
801013db:	6a 01                	push   $0x1
801013dd:	ff 75 08             	pushl  0x8(%ebp)
801013e0:	e8 eb ec ff ff       	call   801000d0 <bread>
801013e5:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
801013e7:	8d 40 5c             	lea    0x5c(%eax),%eax
801013ea:	83 c4 0c             	add    $0xc,%esp
801013ed:	6a 1c                	push   $0x1c
801013ef:	50                   	push   %eax
801013f0:	56                   	push   %esi
801013f1:	e8 9a 31 00 00       	call   80104590 <memmove>
  brelse(bp);
801013f6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801013f9:	83 c4 10             	add    $0x10,%esp
}
801013fc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801013ff:	5b                   	pop    %ebx
80101400:	5e                   	pop    %esi
80101401:	5d                   	pop    %ebp
  brelse(bp);
80101402:	e9 d9 ed ff ff       	jmp    801001e0 <brelse>
80101407:	89 f6                	mov    %esi,%esi
80101409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101410 <bfree>:
{
80101410:	55                   	push   %ebp
80101411:	89 e5                	mov    %esp,%ebp
80101413:	56                   	push   %esi
80101414:	53                   	push   %ebx
80101415:	89 d3                	mov    %edx,%ebx
80101417:	89 c6                	mov    %eax,%esi
  readsb(dev, &sb);
80101419:	83 ec 08             	sub    $0x8,%esp
8010141c:	68 c0 09 11 80       	push   $0x801109c0
80101421:	50                   	push   %eax
80101422:	e8 a9 ff ff ff       	call   801013d0 <readsb>
  bp = bread(dev, BBLOCK(b, sb));
80101427:	58                   	pop    %eax
80101428:	5a                   	pop    %edx
80101429:	89 da                	mov    %ebx,%edx
8010142b:	c1 ea 0c             	shr    $0xc,%edx
8010142e:	03 15 d8 09 11 80    	add    0x801109d8,%edx
80101434:	52                   	push   %edx
80101435:	56                   	push   %esi
80101436:	e8 95 ec ff ff       	call   801000d0 <bread>
  m = 1 << (bi % 8);
8010143b:	89 d9                	mov    %ebx,%ecx
  if((bp->data[bi/8] & m) == 0)
8010143d:	c1 fb 03             	sar    $0x3,%ebx
  m = 1 << (bi % 8);
80101440:	ba 01 00 00 00       	mov    $0x1,%edx
80101445:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
80101448:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
8010144e:	83 c4 10             	add    $0x10,%esp
  m = 1 << (bi % 8);
80101451:	d3 e2                	shl    %cl,%edx
  if((bp->data[bi/8] & m) == 0)
80101453:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101458:	85 d1                	test   %edx,%ecx
8010145a:	74 25                	je     80101481 <bfree+0x71>
  bp->data[bi/8] &= ~m;
8010145c:	f7 d2                	not    %edx
8010145e:	89 c6                	mov    %eax,%esi
  log_write(bp);
80101460:	83 ec 0c             	sub    $0xc,%esp
  bp->data[bi/8] &= ~m;
80101463:	21 ca                	and    %ecx,%edx
80101465:	88 54 1e 5c          	mov    %dl,0x5c(%esi,%ebx,1)
  log_write(bp);
80101469:	56                   	push   %esi
8010146a:	e8 11 19 00 00       	call   80102d80 <log_write>
  brelse(bp);
8010146f:	89 34 24             	mov    %esi,(%esp)
80101472:	e8 69 ed ff ff       	call   801001e0 <brelse>
}
80101477:	83 c4 10             	add    $0x10,%esp
8010147a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010147d:	5b                   	pop    %ebx
8010147e:	5e                   	pop    %esi
8010147f:	5d                   	pop    %ebp
80101480:	c3                   	ret    
    panic("freeing free block");
80101481:	83 ec 0c             	sub    $0xc,%esp
80101484:	68 f8 73 10 80       	push   $0x801073f8
80101489:	e8 02 ef ff ff       	call   80100390 <panic>
8010148e:	66 90                	xchg   %ax,%ax

80101490 <iinit>:
{
80101490:	55                   	push   %ebp
80101491:	89 e5                	mov    %esp,%ebp
80101493:	53                   	push   %ebx
80101494:	bb 20 0a 11 80       	mov    $0x80110a20,%ebx
80101499:	83 ec 0c             	sub    $0xc,%esp
  initlock(&icache.lock, "icache");
8010149c:	68 0b 74 10 80       	push   $0x8010740b
801014a1:	68 e0 09 11 80       	push   $0x801109e0
801014a6:	e8 e5 2d 00 00       	call   80104290 <initlock>
801014ab:	83 c4 10             	add    $0x10,%esp
801014ae:	66 90                	xchg   %ax,%ax
    initsleeplock(&icache.inode[i].lock, "inode");
801014b0:	83 ec 08             	sub    $0x8,%esp
801014b3:	68 12 74 10 80       	push   $0x80107412
801014b8:	53                   	push   %ebx
801014b9:	81 c3 90 00 00 00    	add    $0x90,%ebx
801014bf:	e8 9c 2c 00 00       	call   80104160 <initsleeplock>
  for(i = 0; i < NINODE; i++) {
801014c4:	83 c4 10             	add    $0x10,%esp
801014c7:	81 fb 40 26 11 80    	cmp    $0x80112640,%ebx
801014cd:	75 e1                	jne    801014b0 <iinit+0x20>
  readsb(dev, &sb);
801014cf:	83 ec 08             	sub    $0x8,%esp
801014d2:	68 c0 09 11 80       	push   $0x801109c0
801014d7:	ff 75 08             	pushl  0x8(%ebp)
801014da:	e8 f1 fe ff ff       	call   801013d0 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
801014df:	ff 35 d8 09 11 80    	pushl  0x801109d8
801014e5:	ff 35 d4 09 11 80    	pushl  0x801109d4
801014eb:	ff 35 d0 09 11 80    	pushl  0x801109d0
801014f1:	ff 35 cc 09 11 80    	pushl  0x801109cc
801014f7:	ff 35 c8 09 11 80    	pushl  0x801109c8
801014fd:	ff 35 c4 09 11 80    	pushl  0x801109c4
80101503:	ff 35 c0 09 11 80    	pushl  0x801109c0
80101509:	68 78 74 10 80       	push   $0x80107478
8010150e:	e8 4d f1 ff ff       	call   80100660 <cprintf>
}
80101513:	83 c4 30             	add    $0x30,%esp
80101516:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101519:	c9                   	leave  
8010151a:	c3                   	ret    
8010151b:	90                   	nop
8010151c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101520 <ialloc>:
{
80101520:	55                   	push   %ebp
80101521:	89 e5                	mov    %esp,%ebp
80101523:	57                   	push   %edi
80101524:	56                   	push   %esi
80101525:	53                   	push   %ebx
80101526:	83 ec 1c             	sub    $0x1c,%esp
  for(inum = 1; inum < sb.ninodes; inum++){
80101529:	83 3d c8 09 11 80 01 	cmpl   $0x1,0x801109c8
{
80101530:	8b 45 0c             	mov    0xc(%ebp),%eax
80101533:	8b 75 08             	mov    0x8(%ebp),%esi
80101536:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(inum = 1; inum < sb.ninodes; inum++){
80101539:	0f 86 91 00 00 00    	jbe    801015d0 <ialloc+0xb0>
8010153f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101544:	eb 21                	jmp    80101567 <ialloc+0x47>
80101546:	8d 76 00             	lea    0x0(%esi),%esi
80101549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    brelse(bp);
80101550:	83 ec 0c             	sub    $0xc,%esp
  for(inum = 1; inum < sb.ninodes; inum++){
80101553:	83 c3 01             	add    $0x1,%ebx
    brelse(bp);
80101556:	57                   	push   %edi
80101557:	e8 84 ec ff ff       	call   801001e0 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
8010155c:	83 c4 10             	add    $0x10,%esp
8010155f:	39 1d c8 09 11 80    	cmp    %ebx,0x801109c8
80101565:	76 69                	jbe    801015d0 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
80101567:	89 d8                	mov    %ebx,%eax
80101569:	83 ec 08             	sub    $0x8,%esp
8010156c:	c1 e8 03             	shr    $0x3,%eax
8010156f:	03 05 d4 09 11 80    	add    0x801109d4,%eax
80101575:	50                   	push   %eax
80101576:	56                   	push   %esi
80101577:	e8 54 eb ff ff       	call   801000d0 <bread>
8010157c:	89 c7                	mov    %eax,%edi
    dip = (struct dinode*)bp->data + inum%IPB;
8010157e:	89 d8                	mov    %ebx,%eax
    if(dip->type == 0){  // a free inode
80101580:	83 c4 10             	add    $0x10,%esp
    dip = (struct dinode*)bp->data + inum%IPB;
80101583:	83 e0 07             	and    $0x7,%eax
80101586:	c1 e0 06             	shl    $0x6,%eax
80101589:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
8010158d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101591:	75 bd                	jne    80101550 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101593:	83 ec 04             	sub    $0x4,%esp
80101596:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101599:	6a 40                	push   $0x40
8010159b:	6a 00                	push   $0x0
8010159d:	51                   	push   %ecx
8010159e:	e8 3d 2f 00 00       	call   801044e0 <memset>
      dip->type = type;
801015a3:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
801015a7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801015aa:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
801015ad:	89 3c 24             	mov    %edi,(%esp)
801015b0:	e8 cb 17 00 00       	call   80102d80 <log_write>
      brelse(bp);
801015b5:	89 3c 24             	mov    %edi,(%esp)
801015b8:	e8 23 ec ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
801015bd:	83 c4 10             	add    $0x10,%esp
}
801015c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return iget(dev, inum);
801015c3:	89 da                	mov    %ebx,%edx
801015c5:	89 f0                	mov    %esi,%eax
}
801015c7:	5b                   	pop    %ebx
801015c8:	5e                   	pop    %esi
801015c9:	5f                   	pop    %edi
801015ca:	5d                   	pop    %ebp
      return iget(dev, inum);
801015cb:	e9 50 fc ff ff       	jmp    80101220 <iget>
  panic("ialloc: no inodes");
801015d0:	83 ec 0c             	sub    $0xc,%esp
801015d3:	68 18 74 10 80       	push   $0x80107418
801015d8:	e8 b3 ed ff ff       	call   80100390 <panic>
801015dd:	8d 76 00             	lea    0x0(%esi),%esi

801015e0 <iupdate>:
{
801015e0:	55                   	push   %ebp
801015e1:	89 e5                	mov    %esp,%ebp
801015e3:	56                   	push   %esi
801015e4:	53                   	push   %ebx
801015e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015e8:	83 ec 08             	sub    $0x8,%esp
801015eb:	8b 43 04             	mov    0x4(%ebx),%eax
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015ee:	83 c3 5c             	add    $0x5c,%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015f1:	c1 e8 03             	shr    $0x3,%eax
801015f4:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801015fa:	50                   	push   %eax
801015fb:	ff 73 a4             	pushl  -0x5c(%ebx)
801015fe:	e8 cd ea ff ff       	call   801000d0 <bread>
80101603:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
80101605:	8b 43 a8             	mov    -0x58(%ebx),%eax
  dip->type = ip->type;
80101608:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010160c:	83 c4 0c             	add    $0xc,%esp
  dip = (struct dinode*)bp->data + ip->inum%IPB;
8010160f:	83 e0 07             	and    $0x7,%eax
80101612:	c1 e0 06             	shl    $0x6,%eax
80101615:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
80101619:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
8010161c:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101620:	83 c0 0c             	add    $0xc,%eax
  dip->major = ip->major;
80101623:	66 89 50 f6          	mov    %dx,-0xa(%eax)
  dip->minor = ip->minor;
80101627:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010162b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
  dip->nlink = ip->nlink;
8010162f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101633:	66 89 50 fa          	mov    %dx,-0x6(%eax)
  dip->size = ip->size;
80101637:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010163a:	89 50 fc             	mov    %edx,-0x4(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010163d:	6a 34                	push   $0x34
8010163f:	53                   	push   %ebx
80101640:	50                   	push   %eax
80101641:	e8 4a 2f 00 00       	call   80104590 <memmove>
  log_write(bp);
80101646:	89 34 24             	mov    %esi,(%esp)
80101649:	e8 32 17 00 00       	call   80102d80 <log_write>
  brelse(bp);
8010164e:	89 75 08             	mov    %esi,0x8(%ebp)
80101651:	83 c4 10             	add    $0x10,%esp
}
80101654:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101657:	5b                   	pop    %ebx
80101658:	5e                   	pop    %esi
80101659:	5d                   	pop    %ebp
  brelse(bp);
8010165a:	e9 81 eb ff ff       	jmp    801001e0 <brelse>
8010165f:	90                   	nop

80101660 <idup>:
{
80101660:	55                   	push   %ebp
80101661:	89 e5                	mov    %esp,%ebp
80101663:	53                   	push   %ebx
80101664:	83 ec 10             	sub    $0x10,%esp
80101667:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010166a:	68 e0 09 11 80       	push   $0x801109e0
8010166f:	e8 5c 2d 00 00       	call   801043d0 <acquire>
  ip->ref++;
80101674:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
80101678:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
8010167f:	e8 0c 2e 00 00       	call   80104490 <release>
}
80101684:	89 d8                	mov    %ebx,%eax
80101686:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101689:	c9                   	leave  
8010168a:	c3                   	ret    
8010168b:	90                   	nop
8010168c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101690 <ilock>:
{
80101690:	55                   	push   %ebp
80101691:	89 e5                	mov    %esp,%ebp
80101693:	56                   	push   %esi
80101694:	53                   	push   %ebx
80101695:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || ip->ref < 1)
80101698:	85 db                	test   %ebx,%ebx
8010169a:	0f 84 b7 00 00 00    	je     80101757 <ilock+0xc7>
801016a0:	8b 53 08             	mov    0x8(%ebx),%edx
801016a3:	85 d2                	test   %edx,%edx
801016a5:	0f 8e ac 00 00 00    	jle    80101757 <ilock+0xc7>
  acquiresleep(&ip->lock);
801016ab:	8d 43 0c             	lea    0xc(%ebx),%eax
801016ae:	83 ec 0c             	sub    $0xc,%esp
801016b1:	50                   	push   %eax
801016b2:	e8 e9 2a 00 00       	call   801041a0 <acquiresleep>
  if(ip->valid == 0){
801016b7:	8b 43 4c             	mov    0x4c(%ebx),%eax
801016ba:	83 c4 10             	add    $0x10,%esp
801016bd:	85 c0                	test   %eax,%eax
801016bf:	74 0f                	je     801016d0 <ilock+0x40>
}
801016c1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016c4:	5b                   	pop    %ebx
801016c5:	5e                   	pop    %esi
801016c6:	5d                   	pop    %ebp
801016c7:	c3                   	ret    
801016c8:	90                   	nop
801016c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016d0:	8b 43 04             	mov    0x4(%ebx),%eax
801016d3:	83 ec 08             	sub    $0x8,%esp
801016d6:	c1 e8 03             	shr    $0x3,%eax
801016d9:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801016df:	50                   	push   %eax
801016e0:	ff 33                	pushl  (%ebx)
801016e2:	e8 e9 e9 ff ff       	call   801000d0 <bread>
801016e7:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016e9:	8b 43 04             	mov    0x4(%ebx),%eax
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016ec:	83 c4 0c             	add    $0xc,%esp
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016ef:	83 e0 07             	and    $0x7,%eax
801016f2:	c1 e0 06             	shl    $0x6,%eax
801016f5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
801016f9:	0f b7 10             	movzwl (%eax),%edx
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016fc:	83 c0 0c             	add    $0xc,%eax
    ip->type = dip->type;
801016ff:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
80101703:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
80101707:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
8010170b:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
8010170f:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
80101713:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
80101717:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
8010171b:	8b 50 fc             	mov    -0x4(%eax),%edx
8010171e:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101721:	6a 34                	push   $0x34
80101723:	50                   	push   %eax
80101724:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101727:	50                   	push   %eax
80101728:	e8 63 2e 00 00       	call   80104590 <memmove>
    brelse(bp);
8010172d:	89 34 24             	mov    %esi,(%esp)
80101730:	e8 ab ea ff ff       	call   801001e0 <brelse>
    if(ip->type == 0)
80101735:	83 c4 10             	add    $0x10,%esp
80101738:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
    ip->valid = 1;
8010173d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
    if(ip->type == 0)
80101744:	0f 85 77 ff ff ff    	jne    801016c1 <ilock+0x31>
      panic("ilock: no type");
8010174a:	83 ec 0c             	sub    $0xc,%esp
8010174d:	68 30 74 10 80       	push   $0x80107430
80101752:	e8 39 ec ff ff       	call   80100390 <panic>
    panic("ilock");
80101757:	83 ec 0c             	sub    $0xc,%esp
8010175a:	68 2a 74 10 80       	push   $0x8010742a
8010175f:	e8 2c ec ff ff       	call   80100390 <panic>
80101764:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010176a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101770 <iunlock>:
{
80101770:	55                   	push   %ebp
80101771:	89 e5                	mov    %esp,%ebp
80101773:	56                   	push   %esi
80101774:	53                   	push   %ebx
80101775:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101778:	85 db                	test   %ebx,%ebx
8010177a:	74 28                	je     801017a4 <iunlock+0x34>
8010177c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010177f:	83 ec 0c             	sub    $0xc,%esp
80101782:	56                   	push   %esi
80101783:	e8 b8 2a 00 00       	call   80104240 <holdingsleep>
80101788:	83 c4 10             	add    $0x10,%esp
8010178b:	85 c0                	test   %eax,%eax
8010178d:	74 15                	je     801017a4 <iunlock+0x34>
8010178f:	8b 43 08             	mov    0x8(%ebx),%eax
80101792:	85 c0                	test   %eax,%eax
80101794:	7e 0e                	jle    801017a4 <iunlock+0x34>
  releasesleep(&ip->lock);
80101796:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101799:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010179c:	5b                   	pop    %ebx
8010179d:	5e                   	pop    %esi
8010179e:	5d                   	pop    %ebp
  releasesleep(&ip->lock);
8010179f:	e9 5c 2a 00 00       	jmp    80104200 <releasesleep>
    panic("iunlock");
801017a4:	83 ec 0c             	sub    $0xc,%esp
801017a7:	68 3f 74 10 80       	push   $0x8010743f
801017ac:	e8 df eb ff ff       	call   80100390 <panic>
801017b1:	eb 0d                	jmp    801017c0 <iput>
801017b3:	90                   	nop
801017b4:	90                   	nop
801017b5:	90                   	nop
801017b6:	90                   	nop
801017b7:	90                   	nop
801017b8:	90                   	nop
801017b9:	90                   	nop
801017ba:	90                   	nop
801017bb:	90                   	nop
801017bc:	90                   	nop
801017bd:	90                   	nop
801017be:	90                   	nop
801017bf:	90                   	nop

801017c0 <iput>:
{
801017c0:	55                   	push   %ebp
801017c1:	89 e5                	mov    %esp,%ebp
801017c3:	57                   	push   %edi
801017c4:	56                   	push   %esi
801017c5:	53                   	push   %ebx
801017c6:	83 ec 28             	sub    $0x28,%esp
801017c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquiresleep(&ip->lock);
801017cc:	8d 7b 0c             	lea    0xc(%ebx),%edi
801017cf:	57                   	push   %edi
801017d0:	e8 cb 29 00 00       	call   801041a0 <acquiresleep>
  if(ip->valid && ip->nlink == 0){
801017d5:	8b 53 4c             	mov    0x4c(%ebx),%edx
801017d8:	83 c4 10             	add    $0x10,%esp
801017db:	85 d2                	test   %edx,%edx
801017dd:	74 07                	je     801017e6 <iput+0x26>
801017df:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801017e4:	74 32                	je     80101818 <iput+0x58>
  releasesleep(&ip->lock);
801017e6:	83 ec 0c             	sub    $0xc,%esp
801017e9:	57                   	push   %edi
801017ea:	e8 11 2a 00 00       	call   80104200 <releasesleep>
  acquire(&icache.lock);
801017ef:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
801017f6:	e8 d5 2b 00 00       	call   801043d0 <acquire>
  ip->ref--;
801017fb:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
  release(&icache.lock);
801017ff:	83 c4 10             	add    $0x10,%esp
80101802:	c7 45 08 e0 09 11 80 	movl   $0x801109e0,0x8(%ebp)
}
80101809:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010180c:	5b                   	pop    %ebx
8010180d:	5e                   	pop    %esi
8010180e:	5f                   	pop    %edi
8010180f:	5d                   	pop    %ebp
  release(&icache.lock);
80101810:	e9 7b 2c 00 00       	jmp    80104490 <release>
80101815:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&icache.lock);
80101818:	83 ec 0c             	sub    $0xc,%esp
8010181b:	68 e0 09 11 80       	push   $0x801109e0
80101820:	e8 ab 2b 00 00       	call   801043d0 <acquire>
    int r = ip->ref;
80101825:	8b 73 08             	mov    0x8(%ebx),%esi
    release(&icache.lock);
80101828:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
8010182f:	e8 5c 2c 00 00       	call   80104490 <release>
    if(r == 1){
80101834:	83 c4 10             	add    $0x10,%esp
80101837:	83 fe 01             	cmp    $0x1,%esi
8010183a:	75 aa                	jne    801017e6 <iput+0x26>
8010183c:	8d 8b 8c 00 00 00    	lea    0x8c(%ebx),%ecx
80101842:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101845:	8d 73 5c             	lea    0x5c(%ebx),%esi
80101848:	89 cf                	mov    %ecx,%edi
8010184a:	eb 0b                	jmp    80101857 <iput+0x97>
8010184c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101850:	83 c6 04             	add    $0x4,%esi
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101853:	39 fe                	cmp    %edi,%esi
80101855:	74 19                	je     80101870 <iput+0xb0>
    if(ip->addrs[i]){
80101857:	8b 16                	mov    (%esi),%edx
80101859:	85 d2                	test   %edx,%edx
8010185b:	74 f3                	je     80101850 <iput+0x90>
      bfree(ip->dev, ip->addrs[i]);
8010185d:	8b 03                	mov    (%ebx),%eax
8010185f:	e8 ac fb ff ff       	call   80101410 <bfree>
      ip->addrs[i] = 0;
80101864:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010186a:	eb e4                	jmp    80101850 <iput+0x90>
8010186c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  if(ip->addrs[NDIRECT]){
80101870:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
80101876:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101879:	85 c0                	test   %eax,%eax
8010187b:	75 33                	jne    801018b0 <iput+0xf0>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  iupdate(ip);
8010187d:	83 ec 0c             	sub    $0xc,%esp
  ip->size = 0;
80101880:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  iupdate(ip);
80101887:	53                   	push   %ebx
80101888:	e8 53 fd ff ff       	call   801015e0 <iupdate>
      ip->type = 0;
8010188d:	31 c0                	xor    %eax,%eax
8010188f:	66 89 43 50          	mov    %ax,0x50(%ebx)
      iupdate(ip);
80101893:	89 1c 24             	mov    %ebx,(%esp)
80101896:	e8 45 fd ff ff       	call   801015e0 <iupdate>
      ip->valid = 0;
8010189b:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
801018a2:	83 c4 10             	add    $0x10,%esp
801018a5:	e9 3c ff ff ff       	jmp    801017e6 <iput+0x26>
801018aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
801018b0:	83 ec 08             	sub    $0x8,%esp
801018b3:	50                   	push   %eax
801018b4:	ff 33                	pushl  (%ebx)
801018b6:	e8 15 e8 ff ff       	call   801000d0 <bread>
801018bb:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
801018c1:	89 7d e0             	mov    %edi,-0x20(%ebp)
801018c4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
801018c7:	8d 70 5c             	lea    0x5c(%eax),%esi
801018ca:	83 c4 10             	add    $0x10,%esp
801018cd:	89 cf                	mov    %ecx,%edi
801018cf:	eb 0e                	jmp    801018df <iput+0x11f>
801018d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018d8:	83 c6 04             	add    $0x4,%esi
    for(j = 0; j < NINDIRECT; j++){
801018db:	39 fe                	cmp    %edi,%esi
801018dd:	74 0f                	je     801018ee <iput+0x12e>
      if(a[j])
801018df:	8b 16                	mov    (%esi),%edx
801018e1:	85 d2                	test   %edx,%edx
801018e3:	74 f3                	je     801018d8 <iput+0x118>
        bfree(ip->dev, a[j]);
801018e5:	8b 03                	mov    (%ebx),%eax
801018e7:	e8 24 fb ff ff       	call   80101410 <bfree>
801018ec:	eb ea                	jmp    801018d8 <iput+0x118>
    brelse(bp);
801018ee:	83 ec 0c             	sub    $0xc,%esp
801018f1:	ff 75 e4             	pushl  -0x1c(%ebp)
801018f4:	8b 7d e0             	mov    -0x20(%ebp),%edi
801018f7:	e8 e4 e8 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
801018fc:	8b 93 8c 00 00 00    	mov    0x8c(%ebx),%edx
80101902:	8b 03                	mov    (%ebx),%eax
80101904:	e8 07 fb ff ff       	call   80101410 <bfree>
    ip->addrs[NDIRECT] = 0;
80101909:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
80101910:	00 00 00 
80101913:	83 c4 10             	add    $0x10,%esp
80101916:	e9 62 ff ff ff       	jmp    8010187d <iput+0xbd>
8010191b:	90                   	nop
8010191c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101920 <iunlockput>:
{
80101920:	55                   	push   %ebp
80101921:	89 e5                	mov    %esp,%ebp
80101923:	53                   	push   %ebx
80101924:	83 ec 10             	sub    $0x10,%esp
80101927:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
8010192a:	53                   	push   %ebx
8010192b:	e8 40 fe ff ff       	call   80101770 <iunlock>
  iput(ip);
80101930:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101933:	83 c4 10             	add    $0x10,%esp
}
80101936:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101939:	c9                   	leave  
  iput(ip);
8010193a:	e9 81 fe ff ff       	jmp    801017c0 <iput>
8010193f:	90                   	nop

80101940 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
80101940:	55                   	push   %ebp
80101941:	89 e5                	mov    %esp,%ebp
80101943:	8b 55 08             	mov    0x8(%ebp),%edx
80101946:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101949:	8b 0a                	mov    (%edx),%ecx
8010194b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
8010194e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101951:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101954:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101958:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
8010195b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010195f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101963:	8b 52 58             	mov    0x58(%edx),%edx
80101966:	89 50 10             	mov    %edx,0x10(%eax)
}
80101969:	5d                   	pop    %ebp
8010196a:	c3                   	ret    
8010196b:	90                   	nop
8010196c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101970 <readi>:
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101970:	55                   	push   %ebp
80101971:	89 e5                	mov    %esp,%ebp
80101973:	57                   	push   %edi
80101974:	56                   	push   %esi
80101975:	53                   	push   %ebx
80101976:	83 ec 1c             	sub    $0x1c,%esp
80101979:	8b 45 08             	mov    0x8(%ebp),%eax
8010197c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010197f:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101982:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
80101987:	89 75 e0             	mov    %esi,-0x20(%ebp)
8010198a:	89 45 d8             	mov    %eax,-0x28(%ebp)
8010198d:	8b 75 10             	mov    0x10(%ebp),%esi
80101990:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  if(ip->type == T_DEV){
80101993:	0f 84 a7 00 00 00    	je     80101a40 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101999:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010199c:	8b 40 58             	mov    0x58(%eax),%eax
8010199f:	39 c6                	cmp    %eax,%esi
801019a1:	0f 87 ba 00 00 00    	ja     80101a61 <readi+0xf1>
801019a7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801019aa:	89 f9                	mov    %edi,%ecx
801019ac:	01 f1                	add    %esi,%ecx
801019ae:	0f 82 ad 00 00 00    	jb     80101a61 <readi+0xf1>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
801019b4:	89 c2                	mov    %eax,%edx
801019b6:	29 f2                	sub    %esi,%edx
801019b8:	39 c8                	cmp    %ecx,%eax
801019ba:	0f 43 d7             	cmovae %edi,%edx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019bd:	31 ff                	xor    %edi,%edi
801019bf:	85 d2                	test   %edx,%edx
    n = ip->size - off;
801019c1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019c4:	74 6c                	je     80101a32 <readi+0xc2>
801019c6:	8d 76 00             	lea    0x0(%esi),%esi
801019c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019d0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
801019d3:	89 f2                	mov    %esi,%edx
801019d5:	c1 ea 09             	shr    $0x9,%edx
801019d8:	89 d8                	mov    %ebx,%eax
801019da:	e8 11 f9 ff ff       	call   801012f0 <bmap>
801019df:	83 ec 08             	sub    $0x8,%esp
801019e2:	50                   	push   %eax
801019e3:	ff 33                	pushl  (%ebx)
801019e5:	e8 e6 e6 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
801019ea:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019ed:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
801019ef:	89 f0                	mov    %esi,%eax
801019f1:	25 ff 01 00 00       	and    $0x1ff,%eax
801019f6:	b9 00 02 00 00       	mov    $0x200,%ecx
801019fb:	83 c4 0c             	add    $0xc,%esp
801019fe:	29 c1                	sub    %eax,%ecx
    memmove(dst, bp->data + off%BSIZE, m);
80101a00:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
80101a04:	89 55 dc             	mov    %edx,-0x24(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
80101a07:	29 fb                	sub    %edi,%ebx
80101a09:	39 d9                	cmp    %ebx,%ecx
80101a0b:	0f 46 d9             	cmovbe %ecx,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
80101a0e:	53                   	push   %ebx
80101a0f:	50                   	push   %eax
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a10:	01 df                	add    %ebx,%edi
    memmove(dst, bp->data + off%BSIZE, m);
80101a12:	ff 75 e0             	pushl  -0x20(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a15:	01 de                	add    %ebx,%esi
    memmove(dst, bp->data + off%BSIZE, m);
80101a17:	e8 74 2b 00 00       	call   80104590 <memmove>
    brelse(bp);
80101a1c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101a1f:	89 14 24             	mov    %edx,(%esp)
80101a22:	e8 b9 e7 ff ff       	call   801001e0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a27:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a2a:	83 c4 10             	add    $0x10,%esp
80101a2d:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a30:	77 9e                	ja     801019d0 <readi+0x60>
  }
  return n;
80101a32:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101a35:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a38:	5b                   	pop    %ebx
80101a39:	5e                   	pop    %esi
80101a3a:	5f                   	pop    %edi
80101a3b:	5d                   	pop    %ebp
80101a3c:	c3                   	ret    
80101a3d:	8d 76 00             	lea    0x0(%esi),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101a40:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101a44:	66 83 f8 09          	cmp    $0x9,%ax
80101a48:	77 17                	ja     80101a61 <readi+0xf1>
80101a4a:	8b 04 c5 60 09 11 80 	mov    -0x7feef6a0(,%eax,8),%eax
80101a51:	85 c0                	test   %eax,%eax
80101a53:	74 0c                	je     80101a61 <readi+0xf1>
    return devsw[ip->major].read(ip, dst, n);
80101a55:	89 7d 10             	mov    %edi,0x10(%ebp)
}
80101a58:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a5b:	5b                   	pop    %ebx
80101a5c:	5e                   	pop    %esi
80101a5d:	5f                   	pop    %edi
80101a5e:	5d                   	pop    %ebp
    return devsw[ip->major].read(ip, dst, n);
80101a5f:	ff e0                	jmp    *%eax
      return -1;
80101a61:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a66:	eb cd                	jmp    80101a35 <readi+0xc5>
80101a68:	90                   	nop
80101a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101a70 <writei>:
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a70:	55                   	push   %ebp
80101a71:	89 e5                	mov    %esp,%ebp
80101a73:	57                   	push   %edi
80101a74:	56                   	push   %esi
80101a75:	53                   	push   %ebx
80101a76:	83 ec 1c             	sub    $0x1c,%esp
80101a79:	8b 45 08             	mov    0x8(%ebp),%eax
80101a7c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a7f:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a82:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
80101a87:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a8a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a8d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a90:	89 7d e0             	mov    %edi,-0x20(%ebp)
  if(ip->type == T_DEV){
80101a93:	0f 84 b7 00 00 00    	je     80101b50 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101a99:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a9c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a9f:	0f 82 eb 00 00 00    	jb     80101b90 <writei+0x120>
80101aa5:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101aa8:	31 d2                	xor    %edx,%edx
80101aaa:	89 f8                	mov    %edi,%eax
80101aac:	01 f0                	add    %esi,%eax
80101aae:	0f 92 c2             	setb   %dl
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101ab1:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101ab6:	0f 87 d4 00 00 00    	ja     80101b90 <writei+0x120>
80101abc:	85 d2                	test   %edx,%edx
80101abe:	0f 85 cc 00 00 00    	jne    80101b90 <writei+0x120>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101ac4:	85 ff                	test   %edi,%edi
80101ac6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101acd:	74 72                	je     80101b41 <writei+0xd1>
80101acf:	90                   	nop
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ad0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101ad3:	89 f2                	mov    %esi,%edx
80101ad5:	c1 ea 09             	shr    $0x9,%edx
80101ad8:	89 f8                	mov    %edi,%eax
80101ada:	e8 11 f8 ff ff       	call   801012f0 <bmap>
80101adf:	83 ec 08             	sub    $0x8,%esp
80101ae2:	50                   	push   %eax
80101ae3:	ff 37                	pushl  (%edi)
80101ae5:	e8 e6 e5 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101aea:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101aed:	2b 5d e4             	sub    -0x1c(%ebp),%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101af0:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101af2:	89 f0                	mov    %esi,%eax
80101af4:	b9 00 02 00 00       	mov    $0x200,%ecx
80101af9:	83 c4 0c             	add    $0xc,%esp
80101afc:	25 ff 01 00 00       	and    $0x1ff,%eax
80101b01:	29 c1                	sub    %eax,%ecx
    memmove(bp->data + off%BSIZE, src, m);
80101b03:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
80101b07:	39 d9                	cmp    %ebx,%ecx
80101b09:	0f 46 d9             	cmovbe %ecx,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101b0c:	53                   	push   %ebx
80101b0d:	ff 75 dc             	pushl  -0x24(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b10:	01 de                	add    %ebx,%esi
    memmove(bp->data + off%BSIZE, src, m);
80101b12:	50                   	push   %eax
80101b13:	e8 78 2a 00 00       	call   80104590 <memmove>
    log_write(bp);
80101b18:	89 3c 24             	mov    %edi,(%esp)
80101b1b:	e8 60 12 00 00       	call   80102d80 <log_write>
    brelse(bp);
80101b20:	89 3c 24             	mov    %edi,(%esp)
80101b23:	e8 b8 e6 ff ff       	call   801001e0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b28:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b2b:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b2e:	83 c4 10             	add    $0x10,%esp
80101b31:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101b34:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80101b37:	77 97                	ja     80101ad0 <writei+0x60>
  }

  if(n > 0 && off > ip->size){
80101b39:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b3c:	3b 70 58             	cmp    0x58(%eax),%esi
80101b3f:	77 37                	ja     80101b78 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101b41:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101b44:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b47:	5b                   	pop    %ebx
80101b48:	5e                   	pop    %esi
80101b49:	5f                   	pop    %edi
80101b4a:	5d                   	pop    %ebp
80101b4b:	c3                   	ret    
80101b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101b50:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b54:	66 83 f8 09          	cmp    $0x9,%ax
80101b58:	77 36                	ja     80101b90 <writei+0x120>
80101b5a:	8b 04 c5 64 09 11 80 	mov    -0x7feef69c(,%eax,8),%eax
80101b61:	85 c0                	test   %eax,%eax
80101b63:	74 2b                	je     80101b90 <writei+0x120>
    return devsw[ip->major].write(ip, src, n);
80101b65:	89 7d 10             	mov    %edi,0x10(%ebp)
}
80101b68:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b6b:	5b                   	pop    %ebx
80101b6c:	5e                   	pop    %esi
80101b6d:	5f                   	pop    %edi
80101b6e:	5d                   	pop    %ebp
    return devsw[ip->major].write(ip, src, n);
80101b6f:	ff e0                	jmp    *%eax
80101b71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    ip->size = off;
80101b78:	8b 45 d8             	mov    -0x28(%ebp),%eax
    iupdate(ip);
80101b7b:	83 ec 0c             	sub    $0xc,%esp
    ip->size = off;
80101b7e:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101b81:	50                   	push   %eax
80101b82:	e8 59 fa ff ff       	call   801015e0 <iupdate>
80101b87:	83 c4 10             	add    $0x10,%esp
80101b8a:	eb b5                	jmp    80101b41 <writei+0xd1>
80101b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return -1;
80101b90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b95:	eb ad                	jmp    80101b44 <writei+0xd4>
80101b97:	89 f6                	mov    %esi,%esi
80101b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ba0 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101ba0:	55                   	push   %ebp
80101ba1:	89 e5                	mov    %esp,%ebp
80101ba3:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101ba6:	6a 0e                	push   $0xe
80101ba8:	ff 75 0c             	pushl  0xc(%ebp)
80101bab:	ff 75 08             	pushl  0x8(%ebp)
80101bae:	e8 4d 2a 00 00       	call   80104600 <strncmp>
}
80101bb3:	c9                   	leave  
80101bb4:	c3                   	ret    
80101bb5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101bc0 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101bc0:	55                   	push   %ebp
80101bc1:	89 e5                	mov    %esp,%ebp
80101bc3:	57                   	push   %edi
80101bc4:	56                   	push   %esi
80101bc5:	53                   	push   %ebx
80101bc6:	83 ec 1c             	sub    $0x1c,%esp
80101bc9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101bcc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101bd1:	0f 85 85 00 00 00    	jne    80101c5c <dirlookup+0x9c>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101bd7:	8b 53 58             	mov    0x58(%ebx),%edx
80101bda:	31 ff                	xor    %edi,%edi
80101bdc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101bdf:	85 d2                	test   %edx,%edx
80101be1:	74 3e                	je     80101c21 <dirlookup+0x61>
80101be3:	90                   	nop
80101be4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101be8:	6a 10                	push   $0x10
80101bea:	57                   	push   %edi
80101beb:	56                   	push   %esi
80101bec:	53                   	push   %ebx
80101bed:	e8 7e fd ff ff       	call   80101970 <readi>
80101bf2:	83 c4 10             	add    $0x10,%esp
80101bf5:	83 f8 10             	cmp    $0x10,%eax
80101bf8:	75 55                	jne    80101c4f <dirlookup+0x8f>
      panic("dirlookup read");
    if(de.inum == 0)
80101bfa:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101bff:	74 18                	je     80101c19 <dirlookup+0x59>
  return strncmp(s, t, DIRSIZ);
80101c01:	8d 45 da             	lea    -0x26(%ebp),%eax
80101c04:	83 ec 04             	sub    $0x4,%esp
80101c07:	6a 0e                	push   $0xe
80101c09:	50                   	push   %eax
80101c0a:	ff 75 0c             	pushl  0xc(%ebp)
80101c0d:	e8 ee 29 00 00       	call   80104600 <strncmp>
      continue;
    if(namecmp(name, de.name) == 0){
80101c12:	83 c4 10             	add    $0x10,%esp
80101c15:	85 c0                	test   %eax,%eax
80101c17:	74 17                	je     80101c30 <dirlookup+0x70>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101c19:	83 c7 10             	add    $0x10,%edi
80101c1c:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101c1f:	72 c7                	jb     80101be8 <dirlookup+0x28>
      return iget(dp->dev, inum);
    }
  }

  return 0;
}
80101c21:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80101c24:	31 c0                	xor    %eax,%eax
}
80101c26:	5b                   	pop    %ebx
80101c27:	5e                   	pop    %esi
80101c28:	5f                   	pop    %edi
80101c29:	5d                   	pop    %ebp
80101c2a:	c3                   	ret    
80101c2b:	90                   	nop
80101c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(poff)
80101c30:	8b 45 10             	mov    0x10(%ebp),%eax
80101c33:	85 c0                	test   %eax,%eax
80101c35:	74 05                	je     80101c3c <dirlookup+0x7c>
        *poff = off;
80101c37:	8b 45 10             	mov    0x10(%ebp),%eax
80101c3a:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
80101c3c:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
      return iget(dp->dev, inum);
80101c40:	8b 03                	mov    (%ebx),%eax
80101c42:	e8 d9 f5 ff ff       	call   80101220 <iget>
}
80101c47:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c4a:	5b                   	pop    %ebx
80101c4b:	5e                   	pop    %esi
80101c4c:	5f                   	pop    %edi
80101c4d:	5d                   	pop    %ebp
80101c4e:	c3                   	ret    
      panic("dirlookup read");
80101c4f:	83 ec 0c             	sub    $0xc,%esp
80101c52:	68 59 74 10 80       	push   $0x80107459
80101c57:	e8 34 e7 ff ff       	call   80100390 <panic>
    panic("dirlookup not DIR");
80101c5c:	83 ec 0c             	sub    $0xc,%esp
80101c5f:	68 47 74 10 80       	push   $0x80107447
80101c64:	e8 27 e7 ff ff       	call   80100390 <panic>
80101c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101c70 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c70:	55                   	push   %ebp
80101c71:	89 e5                	mov    %esp,%ebp
80101c73:	57                   	push   %edi
80101c74:	56                   	push   %esi
80101c75:	53                   	push   %ebx
80101c76:	89 cf                	mov    %ecx,%edi
80101c78:	89 c3                	mov    %eax,%ebx
80101c7a:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101c7d:	80 38 2f             	cmpb   $0x2f,(%eax)
{
80101c80:	89 55 e0             	mov    %edx,-0x20(%ebp)
  if(*path == '/')
80101c83:	0f 84 67 01 00 00    	je     80101df0 <namex+0x180>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101c89:	e8 c2 1b 00 00       	call   80103850 <myproc>
  acquire(&icache.lock);
80101c8e:	83 ec 0c             	sub    $0xc,%esp
    ip = idup(myproc()->cwd);
80101c91:	8b 70 68             	mov    0x68(%eax),%esi
  acquire(&icache.lock);
80101c94:	68 e0 09 11 80       	push   $0x801109e0
80101c99:	e8 32 27 00 00       	call   801043d0 <acquire>
  ip->ref++;
80101c9e:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101ca2:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101ca9:	e8 e2 27 00 00       	call   80104490 <release>
80101cae:	83 c4 10             	add    $0x10,%esp
80101cb1:	eb 08                	jmp    80101cbb <namex+0x4b>
80101cb3:	90                   	nop
80101cb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    path++;
80101cb8:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101cbb:	0f b6 03             	movzbl (%ebx),%eax
80101cbe:	3c 2f                	cmp    $0x2f,%al
80101cc0:	74 f6                	je     80101cb8 <namex+0x48>
  if(*path == 0)
80101cc2:	84 c0                	test   %al,%al
80101cc4:	0f 84 ee 00 00 00    	je     80101db8 <namex+0x148>
  while(*path != '/' && *path != 0)
80101cca:	0f b6 03             	movzbl (%ebx),%eax
80101ccd:	3c 2f                	cmp    $0x2f,%al
80101ccf:	0f 84 b3 00 00 00    	je     80101d88 <namex+0x118>
80101cd5:	84 c0                	test   %al,%al
80101cd7:	89 da                	mov    %ebx,%edx
80101cd9:	75 09                	jne    80101ce4 <namex+0x74>
80101cdb:	e9 a8 00 00 00       	jmp    80101d88 <namex+0x118>
80101ce0:	84 c0                	test   %al,%al
80101ce2:	74 0a                	je     80101cee <namex+0x7e>
    path++;
80101ce4:	83 c2 01             	add    $0x1,%edx
  while(*path != '/' && *path != 0)
80101ce7:	0f b6 02             	movzbl (%edx),%eax
80101cea:	3c 2f                	cmp    $0x2f,%al
80101cec:	75 f2                	jne    80101ce0 <namex+0x70>
80101cee:	89 d1                	mov    %edx,%ecx
80101cf0:	29 d9                	sub    %ebx,%ecx
  if(len >= DIRSIZ)
80101cf2:	83 f9 0d             	cmp    $0xd,%ecx
80101cf5:	0f 8e 91 00 00 00    	jle    80101d8c <namex+0x11c>
    memmove(name, s, DIRSIZ);
80101cfb:	83 ec 04             	sub    $0x4,%esp
80101cfe:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101d01:	6a 0e                	push   $0xe
80101d03:	53                   	push   %ebx
80101d04:	57                   	push   %edi
80101d05:	e8 86 28 00 00       	call   80104590 <memmove>
    path++;
80101d0a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    memmove(name, s, DIRSIZ);
80101d0d:	83 c4 10             	add    $0x10,%esp
    path++;
80101d10:	89 d3                	mov    %edx,%ebx
  while(*path == '/')
80101d12:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101d15:	75 11                	jne    80101d28 <namex+0xb8>
80101d17:	89 f6                	mov    %esi,%esi
80101d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    path++;
80101d20:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101d23:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d26:	74 f8                	je     80101d20 <namex+0xb0>

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101d28:	83 ec 0c             	sub    $0xc,%esp
80101d2b:	56                   	push   %esi
80101d2c:	e8 5f f9 ff ff       	call   80101690 <ilock>
    if(ip->type != T_DIR){
80101d31:	83 c4 10             	add    $0x10,%esp
80101d34:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d39:	0f 85 91 00 00 00    	jne    80101dd0 <namex+0x160>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101d3f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d42:	85 d2                	test   %edx,%edx
80101d44:	74 09                	je     80101d4f <namex+0xdf>
80101d46:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d49:	0f 84 b7 00 00 00    	je     80101e06 <namex+0x196>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101d4f:	83 ec 04             	sub    $0x4,%esp
80101d52:	6a 00                	push   $0x0
80101d54:	57                   	push   %edi
80101d55:	56                   	push   %esi
80101d56:	e8 65 fe ff ff       	call   80101bc0 <dirlookup>
80101d5b:	83 c4 10             	add    $0x10,%esp
80101d5e:	85 c0                	test   %eax,%eax
80101d60:	74 6e                	je     80101dd0 <namex+0x160>
  iunlock(ip);
80101d62:	83 ec 0c             	sub    $0xc,%esp
80101d65:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d68:	56                   	push   %esi
80101d69:	e8 02 fa ff ff       	call   80101770 <iunlock>
  iput(ip);
80101d6e:	89 34 24             	mov    %esi,(%esp)
80101d71:	e8 4a fa ff ff       	call   801017c0 <iput>
80101d76:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d79:	83 c4 10             	add    $0x10,%esp
80101d7c:	89 c6                	mov    %eax,%esi
80101d7e:	e9 38 ff ff ff       	jmp    80101cbb <namex+0x4b>
80101d83:	90                   	nop
80101d84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while(*path != '/' && *path != 0)
80101d88:	89 da                	mov    %ebx,%edx
80101d8a:	31 c9                	xor    %ecx,%ecx
    memmove(name, s, len);
80101d8c:	83 ec 04             	sub    $0x4,%esp
80101d8f:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d92:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d95:	51                   	push   %ecx
80101d96:	53                   	push   %ebx
80101d97:	57                   	push   %edi
80101d98:	e8 f3 27 00 00       	call   80104590 <memmove>
    name[len] = 0;
80101d9d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101da0:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101da3:	83 c4 10             	add    $0x10,%esp
80101da6:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101daa:	89 d3                	mov    %edx,%ebx
80101dac:	e9 61 ff ff ff       	jmp    80101d12 <namex+0xa2>
80101db1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101db8:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101dbb:	85 c0                	test   %eax,%eax
80101dbd:	75 5d                	jne    80101e1c <namex+0x1ac>
    iput(ip);
    return 0;
  }
  return ip;
}
80101dbf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101dc2:	89 f0                	mov    %esi,%eax
80101dc4:	5b                   	pop    %ebx
80101dc5:	5e                   	pop    %esi
80101dc6:	5f                   	pop    %edi
80101dc7:	5d                   	pop    %ebp
80101dc8:	c3                   	ret    
80101dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  iunlock(ip);
80101dd0:	83 ec 0c             	sub    $0xc,%esp
80101dd3:	56                   	push   %esi
80101dd4:	e8 97 f9 ff ff       	call   80101770 <iunlock>
  iput(ip);
80101dd9:	89 34 24             	mov    %esi,(%esp)
      return 0;
80101ddc:	31 f6                	xor    %esi,%esi
  iput(ip);
80101dde:	e8 dd f9 ff ff       	call   801017c0 <iput>
      return 0;
80101de3:	83 c4 10             	add    $0x10,%esp
}
80101de6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101de9:	89 f0                	mov    %esi,%eax
80101deb:	5b                   	pop    %ebx
80101dec:	5e                   	pop    %esi
80101ded:	5f                   	pop    %edi
80101dee:	5d                   	pop    %ebp
80101def:	c3                   	ret    
    ip = iget(ROOTDEV, ROOTINO);
80101df0:	ba 01 00 00 00       	mov    $0x1,%edx
80101df5:	b8 01 00 00 00       	mov    $0x1,%eax
80101dfa:	e8 21 f4 ff ff       	call   80101220 <iget>
80101dff:	89 c6                	mov    %eax,%esi
80101e01:	e9 b5 fe ff ff       	jmp    80101cbb <namex+0x4b>
      iunlock(ip);
80101e06:	83 ec 0c             	sub    $0xc,%esp
80101e09:	56                   	push   %esi
80101e0a:	e8 61 f9 ff ff       	call   80101770 <iunlock>
      return ip;
80101e0f:	83 c4 10             	add    $0x10,%esp
}
80101e12:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e15:	89 f0                	mov    %esi,%eax
80101e17:	5b                   	pop    %ebx
80101e18:	5e                   	pop    %esi
80101e19:	5f                   	pop    %edi
80101e1a:	5d                   	pop    %ebp
80101e1b:	c3                   	ret    
    iput(ip);
80101e1c:	83 ec 0c             	sub    $0xc,%esp
80101e1f:	56                   	push   %esi
    return 0;
80101e20:	31 f6                	xor    %esi,%esi
    iput(ip);
80101e22:	e8 99 f9 ff ff       	call   801017c0 <iput>
    return 0;
80101e27:	83 c4 10             	add    $0x10,%esp
80101e2a:	eb 93                	jmp    80101dbf <namex+0x14f>
80101e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101e30 <dirlink>:
{
80101e30:	55                   	push   %ebp
80101e31:	89 e5                	mov    %esp,%ebp
80101e33:	57                   	push   %edi
80101e34:	56                   	push   %esi
80101e35:	53                   	push   %ebx
80101e36:	83 ec 20             	sub    $0x20,%esp
80101e39:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((ip = dirlookup(dp, name, 0)) != 0){
80101e3c:	6a 00                	push   $0x0
80101e3e:	ff 75 0c             	pushl  0xc(%ebp)
80101e41:	53                   	push   %ebx
80101e42:	e8 79 fd ff ff       	call   80101bc0 <dirlookup>
80101e47:	83 c4 10             	add    $0x10,%esp
80101e4a:	85 c0                	test   %eax,%eax
80101e4c:	75 67                	jne    80101eb5 <dirlink+0x85>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101e4e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e51:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e54:	85 ff                	test   %edi,%edi
80101e56:	74 29                	je     80101e81 <dirlink+0x51>
80101e58:	31 ff                	xor    %edi,%edi
80101e5a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e5d:	eb 09                	jmp    80101e68 <dirlink+0x38>
80101e5f:	90                   	nop
80101e60:	83 c7 10             	add    $0x10,%edi
80101e63:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101e66:	73 19                	jae    80101e81 <dirlink+0x51>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e68:	6a 10                	push   $0x10
80101e6a:	57                   	push   %edi
80101e6b:	56                   	push   %esi
80101e6c:	53                   	push   %ebx
80101e6d:	e8 fe fa ff ff       	call   80101970 <readi>
80101e72:	83 c4 10             	add    $0x10,%esp
80101e75:	83 f8 10             	cmp    $0x10,%eax
80101e78:	75 4e                	jne    80101ec8 <dirlink+0x98>
    if(de.inum == 0)
80101e7a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e7f:	75 df                	jne    80101e60 <dirlink+0x30>
  strncpy(de.name, name, DIRSIZ);
80101e81:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e84:	83 ec 04             	sub    $0x4,%esp
80101e87:	6a 0e                	push   $0xe
80101e89:	ff 75 0c             	pushl  0xc(%ebp)
80101e8c:	50                   	push   %eax
80101e8d:	e8 ce 27 00 00       	call   80104660 <strncpy>
  de.inum = inum;
80101e92:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e95:	6a 10                	push   $0x10
80101e97:	57                   	push   %edi
80101e98:	56                   	push   %esi
80101e99:	53                   	push   %ebx
  de.inum = inum;
80101e9a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e9e:	e8 cd fb ff ff       	call   80101a70 <writei>
80101ea3:	83 c4 20             	add    $0x20,%esp
80101ea6:	83 f8 10             	cmp    $0x10,%eax
80101ea9:	75 2a                	jne    80101ed5 <dirlink+0xa5>
  return 0;
80101eab:	31 c0                	xor    %eax,%eax
}
80101ead:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101eb0:	5b                   	pop    %ebx
80101eb1:	5e                   	pop    %esi
80101eb2:	5f                   	pop    %edi
80101eb3:	5d                   	pop    %ebp
80101eb4:	c3                   	ret    
    iput(ip);
80101eb5:	83 ec 0c             	sub    $0xc,%esp
80101eb8:	50                   	push   %eax
80101eb9:	e8 02 f9 ff ff       	call   801017c0 <iput>
    return -1;
80101ebe:	83 c4 10             	add    $0x10,%esp
80101ec1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101ec6:	eb e5                	jmp    80101ead <dirlink+0x7d>
      panic("dirlink read");
80101ec8:	83 ec 0c             	sub    $0xc,%esp
80101ecb:	68 68 74 10 80       	push   $0x80107468
80101ed0:	e8 bb e4 ff ff       	call   80100390 <panic>
    panic("dirlink");
80101ed5:	83 ec 0c             	sub    $0xc,%esp
80101ed8:	68 66 7a 10 80       	push   $0x80107a66
80101edd:	e8 ae e4 ff ff       	call   80100390 <panic>
80101ee2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ef0 <namei>:

struct inode*
namei(char *path)
{
80101ef0:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101ef1:	31 d2                	xor    %edx,%edx
{
80101ef3:	89 e5                	mov    %esp,%ebp
80101ef5:	83 ec 18             	sub    $0x18,%esp
  return namex(path, 0, name);
80101ef8:	8b 45 08             	mov    0x8(%ebp),%eax
80101efb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101efe:	e8 6d fd ff ff       	call   80101c70 <namex>
}
80101f03:	c9                   	leave  
80101f04:	c3                   	ret    
80101f05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f10 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101f10:	55                   	push   %ebp
  return namex(path, 1, name);
80101f11:	ba 01 00 00 00       	mov    $0x1,%edx
{
80101f16:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101f18:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101f1b:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101f1e:	5d                   	pop    %ebp
  return namex(path, 1, name);
80101f1f:	e9 4c fd ff ff       	jmp    80101c70 <namex>
80101f24:	66 90                	xchg   %ax,%ax
80101f26:	66 90                	xchg   %ax,%ax
80101f28:	66 90                	xchg   %ax,%ax
80101f2a:	66 90                	xchg   %ax,%ax
80101f2c:	66 90                	xchg   %ax,%ax
80101f2e:	66 90                	xchg   %ax,%ax

80101f30 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101f30:	55                   	push   %ebp
80101f31:	89 e5                	mov    %esp,%ebp
80101f33:	57                   	push   %edi
80101f34:	56                   	push   %esi
80101f35:	53                   	push   %ebx
80101f36:	83 ec 0c             	sub    $0xc,%esp
  if(b == 0)
80101f39:	85 c0                	test   %eax,%eax
80101f3b:	0f 84 b4 00 00 00    	je     80101ff5 <idestart+0xc5>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101f41:	8b 58 08             	mov    0x8(%eax),%ebx
80101f44:	89 c6                	mov    %eax,%esi
80101f46:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101f4c:	0f 87 96 00 00 00    	ja     80101fe8 <idestart+0xb8>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101f52:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80101f57:	89 f6                	mov    %esi,%esi
80101f59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101f60:	89 ca                	mov    %ecx,%edx
80101f62:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101f63:	83 e0 c0             	and    $0xffffffc0,%eax
80101f66:	3c 40                	cmp    $0x40,%al
80101f68:	75 f6                	jne    80101f60 <idestart+0x30>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101f6a:	31 ff                	xor    %edi,%edi
80101f6c:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f71:	89 f8                	mov    %edi,%eax
80101f73:	ee                   	out    %al,(%dx)
80101f74:	b8 01 00 00 00       	mov    $0x1,%eax
80101f79:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f7e:	ee                   	out    %al,(%dx)
80101f7f:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f84:	89 d8                	mov    %ebx,%eax
80101f86:	ee                   	out    %al,(%dx)

  idewait(0);
  outb(0x3f6, 0);  // generate interrupt
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
80101f87:	89 d8                	mov    %ebx,%eax
80101f89:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f8e:	c1 f8 08             	sar    $0x8,%eax
80101f91:	ee                   	out    %al,(%dx)
80101f92:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f97:	89 f8                	mov    %edi,%eax
80101f99:	ee                   	out    %al,(%dx)
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
80101f9a:	0f b6 46 04          	movzbl 0x4(%esi),%eax
80101f9e:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101fa3:	c1 e0 04             	shl    $0x4,%eax
80101fa6:	83 e0 10             	and    $0x10,%eax
80101fa9:	83 c8 e0             	or     $0xffffffe0,%eax
80101fac:	ee                   	out    %al,(%dx)
  if(b->flags & B_DIRTY){
80101fad:	f6 06 04             	testb  $0x4,(%esi)
80101fb0:	75 16                	jne    80101fc8 <idestart+0x98>
80101fb2:	b8 20 00 00 00       	mov    $0x20,%eax
80101fb7:	89 ca                	mov    %ecx,%edx
80101fb9:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101fba:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101fbd:	5b                   	pop    %ebx
80101fbe:	5e                   	pop    %esi
80101fbf:	5f                   	pop    %edi
80101fc0:	5d                   	pop    %ebp
80101fc1:	c3                   	ret    
80101fc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101fc8:	b8 30 00 00 00       	mov    $0x30,%eax
80101fcd:	89 ca                	mov    %ecx,%edx
80101fcf:	ee                   	out    %al,(%dx)
  asm volatile("cld; rep outsl" :
80101fd0:	b9 80 00 00 00       	mov    $0x80,%ecx
    outsl(0x1f0, b->data, BSIZE/4);
80101fd5:	83 c6 5c             	add    $0x5c,%esi
80101fd8:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101fdd:	fc                   	cld    
80101fde:	f3 6f                	rep outsl %ds:(%esi),(%dx)
}
80101fe0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101fe3:	5b                   	pop    %ebx
80101fe4:	5e                   	pop    %esi
80101fe5:	5f                   	pop    %edi
80101fe6:	5d                   	pop    %ebp
80101fe7:	c3                   	ret    
    panic("incorrect blockno");
80101fe8:	83 ec 0c             	sub    $0xc,%esp
80101feb:	68 d4 74 10 80       	push   $0x801074d4
80101ff0:	e8 9b e3 ff ff       	call   80100390 <panic>
    panic("idestart");
80101ff5:	83 ec 0c             	sub    $0xc,%esp
80101ff8:	68 cb 74 10 80       	push   $0x801074cb
80101ffd:	e8 8e e3 ff ff       	call   80100390 <panic>
80102002:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102010 <ideinit>:
{
80102010:	55                   	push   %ebp
80102011:	89 e5                	mov    %esp,%ebp
80102013:	83 ec 10             	sub    $0x10,%esp
  initlock(&idelock, "ide");
80102016:	68 e6 74 10 80       	push   $0x801074e6
8010201b:	68 80 a5 10 80       	push   $0x8010a580
80102020:	e8 6b 22 00 00       	call   80104290 <initlock>
  ioapicenable(IRQ_IDE, ncpu - 1);
80102025:	58                   	pop    %eax
80102026:	a1 00 2d 11 80       	mov    0x80112d00,%eax
8010202b:	5a                   	pop    %edx
8010202c:	83 e8 01             	sub    $0x1,%eax
8010202f:	50                   	push   %eax
80102030:	6a 0e                	push   $0xe
80102032:	e8 a9 02 00 00       	call   801022e0 <ioapicenable>
80102037:	83 c4 10             	add    $0x10,%esp
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010203a:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010203f:	90                   	nop
80102040:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102041:	83 e0 c0             	and    $0xffffffc0,%eax
80102044:	3c 40                	cmp    $0x40,%al
80102046:	75 f8                	jne    80102040 <ideinit+0x30>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102048:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
8010204d:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102052:	ee                   	out    %al,(%dx)
80102053:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102058:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010205d:	eb 06                	jmp    80102065 <ideinit+0x55>
8010205f:	90                   	nop
  for(i=0; i<1000; i++){
80102060:	83 e9 01             	sub    $0x1,%ecx
80102063:	74 0f                	je     80102074 <ideinit+0x64>
80102065:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80102066:	84 c0                	test   %al,%al
80102068:	74 f6                	je     80102060 <ideinit+0x50>
      havedisk1 = 1;
8010206a:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102071:	00 00 00 
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102074:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
80102079:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010207e:	ee                   	out    %al,(%dx)
}
8010207f:	c9                   	leave  
80102080:	c3                   	ret    
80102081:	eb 0d                	jmp    80102090 <ideintr>
80102083:	90                   	nop
80102084:	90                   	nop
80102085:	90                   	nop
80102086:	90                   	nop
80102087:	90                   	nop
80102088:	90                   	nop
80102089:	90                   	nop
8010208a:	90                   	nop
8010208b:	90                   	nop
8010208c:	90                   	nop
8010208d:	90                   	nop
8010208e:	90                   	nop
8010208f:	90                   	nop

80102090 <ideintr>:

// Interrupt handler.
void
ideintr(void)
{
80102090:	55                   	push   %ebp
80102091:	89 e5                	mov    %esp,%ebp
80102093:	57                   	push   %edi
80102094:	56                   	push   %esi
80102095:	53                   	push   %ebx
80102096:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102099:	68 80 a5 10 80       	push   $0x8010a580
8010209e:	e8 2d 23 00 00       	call   801043d0 <acquire>

  if((b = idequeue) == 0){
801020a3:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
801020a9:	83 c4 10             	add    $0x10,%esp
801020ac:	85 db                	test   %ebx,%ebx
801020ae:	74 67                	je     80102117 <ideintr+0x87>
    release(&idelock);
    return;
  }
  idequeue = b->qnext;
801020b0:	8b 43 58             	mov    0x58(%ebx),%eax
801020b3:	a3 64 a5 10 80       	mov    %eax,0x8010a564

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
801020b8:	8b 3b                	mov    (%ebx),%edi
801020ba:	f7 c7 04 00 00 00    	test   $0x4,%edi
801020c0:	75 31                	jne    801020f3 <ideintr+0x63>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801020c2:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020c7:	89 f6                	mov    %esi,%esi
801020c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801020d0:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801020d1:	89 c6                	mov    %eax,%esi
801020d3:	83 e6 c0             	and    $0xffffffc0,%esi
801020d6:	89 f1                	mov    %esi,%ecx
801020d8:	80 f9 40             	cmp    $0x40,%cl
801020db:	75 f3                	jne    801020d0 <ideintr+0x40>
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
801020dd:	a8 21                	test   $0x21,%al
801020df:	75 12                	jne    801020f3 <ideintr+0x63>
    insl(0x1f0, b->data, BSIZE/4);
801020e1:	8d 7b 5c             	lea    0x5c(%ebx),%edi
  asm volatile("cld; rep insl" :
801020e4:	b9 80 00 00 00       	mov    $0x80,%ecx
801020e9:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020ee:	fc                   	cld    
801020ef:	f3 6d                	rep insl (%dx),%es:(%edi)
801020f1:	8b 3b                	mov    (%ebx),%edi

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
801020f3:	83 e7 fb             	and    $0xfffffffb,%edi
  wakeup(b);
801020f6:	83 ec 0c             	sub    $0xc,%esp
  b->flags &= ~B_DIRTY;
801020f9:	89 f9                	mov    %edi,%ecx
801020fb:	83 c9 02             	or     $0x2,%ecx
801020fe:	89 0b                	mov    %ecx,(%ebx)
  wakeup(b);
80102100:	53                   	push   %ebx
80102101:	e8 aa 1e 00 00       	call   80103fb0 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
80102106:	a1 64 a5 10 80       	mov    0x8010a564,%eax
8010210b:	83 c4 10             	add    $0x10,%esp
8010210e:	85 c0                	test   %eax,%eax
80102110:	74 05                	je     80102117 <ideintr+0x87>
    idestart(idequeue);
80102112:	e8 19 fe ff ff       	call   80101f30 <idestart>
    release(&idelock);
80102117:	83 ec 0c             	sub    $0xc,%esp
8010211a:	68 80 a5 10 80       	push   $0x8010a580
8010211f:	e8 6c 23 00 00       	call   80104490 <release>

  release(&idelock);
}
80102124:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102127:	5b                   	pop    %ebx
80102128:	5e                   	pop    %esi
80102129:	5f                   	pop    %edi
8010212a:	5d                   	pop    %ebp
8010212b:	c3                   	ret    
8010212c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102130 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
80102130:	55                   	push   %ebp
80102131:	89 e5                	mov    %esp,%ebp
80102133:	53                   	push   %ebx
80102134:	83 ec 10             	sub    $0x10,%esp
80102137:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
8010213a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010213d:	50                   	push   %eax
8010213e:	e8 fd 20 00 00       	call   80104240 <holdingsleep>
80102143:	83 c4 10             	add    $0x10,%esp
80102146:	85 c0                	test   %eax,%eax
80102148:	0f 84 c6 00 00 00    	je     80102214 <iderw+0xe4>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
8010214e:	8b 03                	mov    (%ebx),%eax
80102150:	83 e0 06             	and    $0x6,%eax
80102153:	83 f8 02             	cmp    $0x2,%eax
80102156:	0f 84 ab 00 00 00    	je     80102207 <iderw+0xd7>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
8010215c:	8b 53 04             	mov    0x4(%ebx),%edx
8010215f:	85 d2                	test   %edx,%edx
80102161:	74 0d                	je     80102170 <iderw+0x40>
80102163:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102168:	85 c0                	test   %eax,%eax
8010216a:	0f 84 b1 00 00 00    	je     80102221 <iderw+0xf1>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
80102170:	83 ec 0c             	sub    $0xc,%esp
80102173:	68 80 a5 10 80       	push   $0x8010a580
80102178:	e8 53 22 00 00       	call   801043d0 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010217d:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
80102183:	83 c4 10             	add    $0x10,%esp
  b->qnext = 0;
80102186:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010218d:	85 d2                	test   %edx,%edx
8010218f:	75 09                	jne    8010219a <iderw+0x6a>
80102191:	eb 6d                	jmp    80102200 <iderw+0xd0>
80102193:	90                   	nop
80102194:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102198:	89 c2                	mov    %eax,%edx
8010219a:	8b 42 58             	mov    0x58(%edx),%eax
8010219d:	85 c0                	test   %eax,%eax
8010219f:	75 f7                	jne    80102198 <iderw+0x68>
801021a1:	83 c2 58             	add    $0x58,%edx
    ;
  *pp = b;
801021a4:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
801021a6:	39 1d 64 a5 10 80    	cmp    %ebx,0x8010a564
801021ac:	74 42                	je     801021f0 <iderw+0xc0>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801021ae:	8b 03                	mov    (%ebx),%eax
801021b0:	83 e0 06             	and    $0x6,%eax
801021b3:	83 f8 02             	cmp    $0x2,%eax
801021b6:	74 23                	je     801021db <iderw+0xab>
801021b8:	90                   	nop
801021b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    sleep(b, &idelock);
801021c0:	83 ec 08             	sub    $0x8,%esp
801021c3:	68 80 a5 10 80       	push   $0x8010a580
801021c8:	53                   	push   %ebx
801021c9:	e8 22 1c 00 00       	call   80103df0 <sleep>
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801021ce:	8b 03                	mov    (%ebx),%eax
801021d0:	83 c4 10             	add    $0x10,%esp
801021d3:	83 e0 06             	and    $0x6,%eax
801021d6:	83 f8 02             	cmp    $0x2,%eax
801021d9:	75 e5                	jne    801021c0 <iderw+0x90>
  }


  release(&idelock);
801021db:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
}
801021e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801021e5:	c9                   	leave  
  release(&idelock);
801021e6:	e9 a5 22 00 00       	jmp    80104490 <release>
801021eb:	90                   	nop
801021ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    idestart(b);
801021f0:	89 d8                	mov    %ebx,%eax
801021f2:	e8 39 fd ff ff       	call   80101f30 <idestart>
801021f7:	eb b5                	jmp    801021ae <iderw+0x7e>
801021f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
80102200:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
80102205:	eb 9d                	jmp    801021a4 <iderw+0x74>
    panic("iderw: nothing to do");
80102207:	83 ec 0c             	sub    $0xc,%esp
8010220a:	68 00 75 10 80       	push   $0x80107500
8010220f:	e8 7c e1 ff ff       	call   80100390 <panic>
    panic("iderw: buf not locked");
80102214:	83 ec 0c             	sub    $0xc,%esp
80102217:	68 ea 74 10 80       	push   $0x801074ea
8010221c:	e8 6f e1 ff ff       	call   80100390 <panic>
    panic("iderw: ide disk 1 not present");
80102221:	83 ec 0c             	sub    $0xc,%esp
80102224:	68 15 75 10 80       	push   $0x80107515
80102229:	e8 62 e1 ff ff       	call   80100390 <panic>
8010222e:	66 90                	xchg   %ax,%ax

80102230 <ioapicinit>:
  ioapic->data = data;
}

void
ioapicinit(void)
{
80102230:	55                   	push   %ebp
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
80102231:	c7 05 34 26 11 80 00 	movl   $0xfec00000,0x80112634
80102238:	00 c0 fe 
{
8010223b:	89 e5                	mov    %esp,%ebp
8010223d:	56                   	push   %esi
8010223e:	53                   	push   %ebx
  ioapic->reg = reg;
8010223f:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102246:	00 00 00 
  return ioapic->data;
80102249:	a1 34 26 11 80       	mov    0x80112634,%eax
8010224e:	8b 58 10             	mov    0x10(%eax),%ebx
  ioapic->reg = reg;
80102251:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return ioapic->data;
80102257:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
8010225d:	0f b6 15 60 27 11 80 	movzbl 0x80112760,%edx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
80102264:	c1 eb 10             	shr    $0x10,%ebx
  return ioapic->data;
80102267:	8b 41 10             	mov    0x10(%ecx),%eax
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
8010226a:	0f b6 db             	movzbl %bl,%ebx
  id = ioapicread(REG_ID) >> 24;
8010226d:	c1 e8 18             	shr    $0x18,%eax
  if(id != ioapicid)
80102270:	39 c2                	cmp    %eax,%edx
80102272:	74 16                	je     8010228a <ioapicinit+0x5a>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
80102274:	83 ec 0c             	sub    $0xc,%esp
80102277:	68 34 75 10 80       	push   $0x80107534
8010227c:	e8 df e3 ff ff       	call   80100660 <cprintf>
80102281:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
80102287:	83 c4 10             	add    $0x10,%esp
8010228a:	83 c3 21             	add    $0x21,%ebx
{
8010228d:	ba 10 00 00 00       	mov    $0x10,%edx
80102292:	b8 20 00 00 00       	mov    $0x20,%eax
80102297:	89 f6                	mov    %esi,%esi
80102299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  ioapic->reg = reg;
801022a0:	89 11                	mov    %edx,(%ecx)
  ioapic->data = data;
801022a2:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
801022a8:	89 c6                	mov    %eax,%esi
801022aa:	81 ce 00 00 01 00    	or     $0x10000,%esi
801022b0:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
801022b3:	89 71 10             	mov    %esi,0x10(%ecx)
801022b6:	8d 72 01             	lea    0x1(%edx),%esi
801022b9:	83 c2 02             	add    $0x2,%edx
  for(i = 0; i <= maxintr; i++){
801022bc:	39 d8                	cmp    %ebx,%eax
  ioapic->reg = reg;
801022be:	89 31                	mov    %esi,(%ecx)
  ioapic->data = data;
801022c0:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
801022c6:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  for(i = 0; i <= maxintr; i++){
801022cd:	75 d1                	jne    801022a0 <ioapicinit+0x70>
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
801022cf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801022d2:	5b                   	pop    %ebx
801022d3:	5e                   	pop    %esi
801022d4:	5d                   	pop    %ebp
801022d5:	c3                   	ret    
801022d6:	8d 76 00             	lea    0x0(%esi),%esi
801022d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801022e0 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
801022e0:	55                   	push   %ebp
  ioapic->reg = reg;
801022e1:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
{
801022e7:	89 e5                	mov    %esp,%ebp
801022e9:	8b 45 08             	mov    0x8(%ebp),%eax
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
801022ec:	8d 50 20             	lea    0x20(%eax),%edx
801022ef:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
  ioapic->reg = reg;
801022f3:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
801022f5:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022fb:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
801022fe:	89 51 10             	mov    %edx,0x10(%ecx)
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
80102301:	8b 55 0c             	mov    0xc(%ebp),%edx
  ioapic->reg = reg;
80102304:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
80102306:	a1 34 26 11 80       	mov    0x80112634,%eax
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
8010230b:	c1 e2 18             	shl    $0x18,%edx
  ioapic->data = data;
8010230e:	89 50 10             	mov    %edx,0x10(%eax)
}
80102311:	5d                   	pop    %ebp
80102312:	c3                   	ret    
80102313:	66 90                	xchg   %ax,%ax
80102315:	66 90                	xchg   %ax,%ax
80102317:	66 90                	xchg   %ax,%ax
80102319:	66 90                	xchg   %ax,%ax
8010231b:	66 90                	xchg   %ax,%ax
8010231d:	66 90                	xchg   %ax,%ax
8010231f:	90                   	nop

80102320 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
80102320:	55                   	push   %ebp
80102321:	89 e5                	mov    %esp,%ebp
80102323:	53                   	push   %ebx
80102324:	83 ec 04             	sub    $0x4,%esp
80102327:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
8010232a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102330:	75 70                	jne    801023a2 <kfree+0x82>
80102332:	81 fb a8 5d 11 80    	cmp    $0x80115da8,%ebx
80102338:	72 68                	jb     801023a2 <kfree+0x82>
8010233a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102340:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102345:	77 5b                	ja     801023a2 <kfree+0x82>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
80102347:	83 ec 04             	sub    $0x4,%esp
8010234a:	68 00 10 00 00       	push   $0x1000
8010234f:	6a 01                	push   $0x1
80102351:	53                   	push   %ebx
80102352:	e8 89 21 00 00       	call   801044e0 <memset>

  if(kmem.use_lock)
80102357:	8b 15 74 26 11 80    	mov    0x80112674,%edx
8010235d:	83 c4 10             	add    $0x10,%esp
80102360:	85 d2                	test   %edx,%edx
80102362:	75 2c                	jne    80102390 <kfree+0x70>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
80102364:	a1 78 26 11 80       	mov    0x80112678,%eax
80102369:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
8010236b:	a1 74 26 11 80       	mov    0x80112674,%eax
  kmem.freelist = r;
80102370:	89 1d 78 26 11 80    	mov    %ebx,0x80112678
  if(kmem.use_lock)
80102376:	85 c0                	test   %eax,%eax
80102378:	75 06                	jne    80102380 <kfree+0x60>
    release(&kmem.lock);
}
8010237a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010237d:	c9                   	leave  
8010237e:	c3                   	ret    
8010237f:	90                   	nop
    release(&kmem.lock);
80102380:	c7 45 08 40 26 11 80 	movl   $0x80112640,0x8(%ebp)
}
80102387:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010238a:	c9                   	leave  
    release(&kmem.lock);
8010238b:	e9 00 21 00 00       	jmp    80104490 <release>
    acquire(&kmem.lock);
80102390:	83 ec 0c             	sub    $0xc,%esp
80102393:	68 40 26 11 80       	push   $0x80112640
80102398:	e8 33 20 00 00       	call   801043d0 <acquire>
8010239d:	83 c4 10             	add    $0x10,%esp
801023a0:	eb c2                	jmp    80102364 <kfree+0x44>
    panic("kfree");
801023a2:	83 ec 0c             	sub    $0xc,%esp
801023a5:	68 66 75 10 80       	push   $0x80107566
801023aa:	e8 e1 df ff ff       	call   80100390 <panic>
801023af:	90                   	nop

801023b0 <freerange>:
{
801023b0:	55                   	push   %ebp
801023b1:	89 e5                	mov    %esp,%ebp
801023b3:	56                   	push   %esi
801023b4:	53                   	push   %ebx
  p = (char*)PGROUNDUP((uint)vstart);
801023b5:	8b 45 08             	mov    0x8(%ebp),%eax
{
801023b8:	8b 75 0c             	mov    0xc(%ebp),%esi
  p = (char*)PGROUNDUP((uint)vstart);
801023bb:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023c1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023c7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023cd:	39 de                	cmp    %ebx,%esi
801023cf:	72 23                	jb     801023f4 <freerange+0x44>
801023d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
801023d8:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801023de:	83 ec 0c             	sub    $0xc,%esp
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023e1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
801023e7:	50                   	push   %eax
801023e8:	e8 33 ff ff ff       	call   80102320 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023ed:	83 c4 10             	add    $0x10,%esp
801023f0:	39 f3                	cmp    %esi,%ebx
801023f2:	76 e4                	jbe    801023d8 <freerange+0x28>
}
801023f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023f7:	5b                   	pop    %ebx
801023f8:	5e                   	pop    %esi
801023f9:	5d                   	pop    %ebp
801023fa:	c3                   	ret    
801023fb:	90                   	nop
801023fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102400 <kinit1>:
{
80102400:	55                   	push   %ebp
80102401:	89 e5                	mov    %esp,%ebp
80102403:	56                   	push   %esi
80102404:	53                   	push   %ebx
80102405:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
80102408:	83 ec 08             	sub    $0x8,%esp
8010240b:	68 6c 75 10 80       	push   $0x8010756c
80102410:	68 40 26 11 80       	push   $0x80112640
80102415:	e8 76 1e 00 00       	call   80104290 <initlock>
  p = (char*)PGROUNDUP((uint)vstart);
8010241a:	8b 45 08             	mov    0x8(%ebp),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010241d:	83 c4 10             	add    $0x10,%esp
  kmem.use_lock = 0;
80102420:	c7 05 74 26 11 80 00 	movl   $0x0,0x80112674
80102427:	00 00 00 
  p = (char*)PGROUNDUP((uint)vstart);
8010242a:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102430:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102436:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010243c:	39 de                	cmp    %ebx,%esi
8010243e:	72 1c                	jb     8010245c <kinit1+0x5c>
    kfree(p);
80102440:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102446:	83 ec 0c             	sub    $0xc,%esp
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102449:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
8010244f:	50                   	push   %eax
80102450:	e8 cb fe ff ff       	call   80102320 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102455:	83 c4 10             	add    $0x10,%esp
80102458:	39 de                	cmp    %ebx,%esi
8010245a:	73 e4                	jae    80102440 <kinit1+0x40>
}
8010245c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010245f:	5b                   	pop    %ebx
80102460:	5e                   	pop    %esi
80102461:	5d                   	pop    %ebp
80102462:	c3                   	ret    
80102463:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102470 <kinit2>:
{
80102470:	55                   	push   %ebp
80102471:	89 e5                	mov    %esp,%ebp
80102473:	56                   	push   %esi
80102474:	53                   	push   %ebx
  p = (char*)PGROUNDUP((uint)vstart);
80102475:	8b 45 08             	mov    0x8(%ebp),%eax
{
80102478:	8b 75 0c             	mov    0xc(%ebp),%esi
  p = (char*)PGROUNDUP((uint)vstart);
8010247b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102481:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102487:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010248d:	39 de                	cmp    %ebx,%esi
8010248f:	72 23                	jb     801024b4 <kinit2+0x44>
80102491:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102498:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010249e:	83 ec 0c             	sub    $0xc,%esp
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801024a1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
801024a7:	50                   	push   %eax
801024a8:	e8 73 fe ff ff       	call   80102320 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801024ad:	83 c4 10             	add    $0x10,%esp
801024b0:	39 de                	cmp    %ebx,%esi
801024b2:	73 e4                	jae    80102498 <kinit2+0x28>
  kmem.use_lock = 1;
801024b4:	c7 05 74 26 11 80 01 	movl   $0x1,0x80112674
801024bb:	00 00 00 
}
801024be:	8d 65 f8             	lea    -0x8(%ebp),%esp
801024c1:	5b                   	pop    %ebx
801024c2:	5e                   	pop    %esi
801024c3:	5d                   	pop    %ebp
801024c4:	c3                   	ret    
801024c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801024c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801024d0 <kalloc>:
char*
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
801024d0:	a1 74 26 11 80       	mov    0x80112674,%eax
801024d5:	85 c0                	test   %eax,%eax
801024d7:	75 1f                	jne    801024f8 <kalloc+0x28>
    acquire(&kmem.lock);
  r = kmem.freelist;
801024d9:	a1 78 26 11 80       	mov    0x80112678,%eax
  if(r)
801024de:	85 c0                	test   %eax,%eax
801024e0:	74 0e                	je     801024f0 <kalloc+0x20>
    kmem.freelist = r->next;
801024e2:	8b 10                	mov    (%eax),%edx
801024e4:	89 15 78 26 11 80    	mov    %edx,0x80112678
801024ea:	c3                   	ret    
801024eb:	90                   	nop
801024ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(kmem.use_lock)
    release(&kmem.lock);
  return (char*)r;
}
801024f0:	f3 c3                	repz ret 
801024f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
801024f8:	55                   	push   %ebp
801024f9:	89 e5                	mov    %esp,%ebp
801024fb:	83 ec 24             	sub    $0x24,%esp
    acquire(&kmem.lock);
801024fe:	68 40 26 11 80       	push   $0x80112640
80102503:	e8 c8 1e 00 00       	call   801043d0 <acquire>
  r = kmem.freelist;
80102508:	a1 78 26 11 80       	mov    0x80112678,%eax
  if(r)
8010250d:	83 c4 10             	add    $0x10,%esp
80102510:	8b 15 74 26 11 80    	mov    0x80112674,%edx
80102516:	85 c0                	test   %eax,%eax
80102518:	74 08                	je     80102522 <kalloc+0x52>
    kmem.freelist = r->next;
8010251a:	8b 08                	mov    (%eax),%ecx
8010251c:	89 0d 78 26 11 80    	mov    %ecx,0x80112678
  if(kmem.use_lock)
80102522:	85 d2                	test   %edx,%edx
80102524:	74 16                	je     8010253c <kalloc+0x6c>
    release(&kmem.lock);
80102526:	83 ec 0c             	sub    $0xc,%esp
80102529:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010252c:	68 40 26 11 80       	push   $0x80112640
80102531:	e8 5a 1f 00 00       	call   80104490 <release>
  return (char*)r;
80102536:	8b 45 f4             	mov    -0xc(%ebp),%eax
    release(&kmem.lock);
80102539:	83 c4 10             	add    $0x10,%esp
}
8010253c:	c9                   	leave  
8010253d:	c3                   	ret    
8010253e:	66 90                	xchg   %ax,%ax

80102540 <kbdgetc>:
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102540:	ba 64 00 00 00       	mov    $0x64,%edx
80102545:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
80102546:	a8 01                	test   $0x1,%al
80102548:	0f 84 c2 00 00 00    	je     80102610 <kbdgetc+0xd0>
8010254e:	ba 60 00 00 00       	mov    $0x60,%edx
80102553:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
80102554:	0f b6 d0             	movzbl %al,%edx
80102557:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx

  if(data == 0xE0){
8010255d:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102563:	0f 84 7f 00 00 00    	je     801025e8 <kbdgetc+0xa8>
{
80102569:	55                   	push   %ebp
8010256a:	89 e5                	mov    %esp,%ebp
8010256c:	53                   	push   %ebx
8010256d:	89 cb                	mov    %ecx,%ebx
8010256f:	83 e3 40             	and    $0x40,%ebx
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
80102572:	84 c0                	test   %al,%al
80102574:	78 4a                	js     801025c0 <kbdgetc+0x80>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
80102576:	85 db                	test   %ebx,%ebx
80102578:	74 09                	je     80102583 <kbdgetc+0x43>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
8010257a:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
8010257d:	83 e1 bf             	and    $0xffffffbf,%ecx
    data |= 0x80;
80102580:	0f b6 d0             	movzbl %al,%edx
  }

  shift |= shiftcode[data];
80102583:	0f b6 82 a0 76 10 80 	movzbl -0x7fef8960(%edx),%eax
8010258a:	09 c1                	or     %eax,%ecx
  shift ^= togglecode[data];
8010258c:	0f b6 82 a0 75 10 80 	movzbl -0x7fef8a60(%edx),%eax
80102593:	31 c1                	xor    %eax,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
80102595:	89 c8                	mov    %ecx,%eax
  shift ^= togglecode[data];
80102597:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
  c = charcode[shift & (CTL | SHIFT)][data];
8010259d:	83 e0 03             	and    $0x3,%eax
  if(shift & CAPSLOCK){
801025a0:	83 e1 08             	and    $0x8,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
801025a3:	8b 04 85 80 75 10 80 	mov    -0x7fef8a80(,%eax,4),%eax
801025aa:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
  if(shift & CAPSLOCK){
801025ae:	74 31                	je     801025e1 <kbdgetc+0xa1>
    if('a' <= c && c <= 'z')
801025b0:	8d 50 9f             	lea    -0x61(%eax),%edx
801025b3:	83 fa 19             	cmp    $0x19,%edx
801025b6:	77 40                	ja     801025f8 <kbdgetc+0xb8>
      c += 'A' - 'a';
801025b8:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
801025bb:	5b                   	pop    %ebx
801025bc:	5d                   	pop    %ebp
801025bd:	c3                   	ret    
801025be:	66 90                	xchg   %ax,%ax
    data = (shift & E0ESC ? data : data & 0x7F);
801025c0:	83 e0 7f             	and    $0x7f,%eax
801025c3:	85 db                	test   %ebx,%ebx
801025c5:	0f 44 d0             	cmove  %eax,%edx
    shift &= ~(shiftcode[data] | E0ESC);
801025c8:	0f b6 82 a0 76 10 80 	movzbl -0x7fef8960(%edx),%eax
801025cf:	83 c8 40             	or     $0x40,%eax
801025d2:	0f b6 c0             	movzbl %al,%eax
801025d5:	f7 d0                	not    %eax
801025d7:	21 c1                	and    %eax,%ecx
    return 0;
801025d9:	31 c0                	xor    %eax,%eax
    shift &= ~(shiftcode[data] | E0ESC);
801025db:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
}
801025e1:	5b                   	pop    %ebx
801025e2:	5d                   	pop    %ebp
801025e3:	c3                   	ret    
801025e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    shift |= E0ESC;
801025e8:	83 c9 40             	or     $0x40,%ecx
    return 0;
801025eb:	31 c0                	xor    %eax,%eax
    shift |= E0ESC;
801025ed:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
    return 0;
801025f3:	c3                   	ret    
801025f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    else if('A' <= c && c <= 'Z')
801025f8:	8d 48 bf             	lea    -0x41(%eax),%ecx
      c += 'a' - 'A';
801025fb:	8d 50 20             	lea    0x20(%eax),%edx
}
801025fe:	5b                   	pop    %ebx
      c += 'a' - 'A';
801025ff:	83 f9 1a             	cmp    $0x1a,%ecx
80102602:	0f 42 c2             	cmovb  %edx,%eax
}
80102605:	5d                   	pop    %ebp
80102606:	c3                   	ret    
80102607:	89 f6                	mov    %esi,%esi
80102609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80102610:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80102615:	c3                   	ret    
80102616:	8d 76 00             	lea    0x0(%esi),%esi
80102619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102620 <kbdintr>:

void
kbdintr(void)
{
80102620:	55                   	push   %ebp
80102621:	89 e5                	mov    %esp,%ebp
80102623:	83 ec 14             	sub    $0x14,%esp
  consoleintr(kbdgetc);
80102626:	68 40 25 10 80       	push   $0x80102540
8010262b:	e8 e0 e1 ff ff       	call   80100810 <consoleintr>
}
80102630:	83 c4 10             	add    $0x10,%esp
80102633:	c9                   	leave  
80102634:	c3                   	ret    
80102635:	66 90                	xchg   %ax,%ax
80102637:	66 90                	xchg   %ax,%ax
80102639:	66 90                	xchg   %ax,%ax
8010263b:	66 90                	xchg   %ax,%ax
8010263d:	66 90                	xchg   %ax,%ax
8010263f:	90                   	nop

80102640 <lapicinit>:
}

void
lapicinit(void)
{
  if(!lapic)
80102640:	a1 7c 26 11 80       	mov    0x8011267c,%eax
{
80102645:	55                   	push   %ebp
80102646:	89 e5                	mov    %esp,%ebp
  if(!lapic)
80102648:	85 c0                	test   %eax,%eax
8010264a:	0f 84 c8 00 00 00    	je     80102718 <lapicinit+0xd8>
  lapic[index] = value;
80102650:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102657:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010265a:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010265d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102664:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102667:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010266a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102671:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
80102674:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102677:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010267e:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
80102681:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102684:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010268b:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010268e:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102691:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102698:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010269b:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
8010269e:	8b 50 30             	mov    0x30(%eax),%edx
801026a1:	c1 ea 10             	shr    $0x10,%edx
801026a4:	80 fa 03             	cmp    $0x3,%dl
801026a7:	77 77                	ja     80102720 <lapicinit+0xe0>
  lapic[index] = value;
801026a9:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
801026b0:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026b3:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026b6:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026bd:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026c0:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026c3:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026ca:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026cd:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026d0:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801026d7:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026da:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026dd:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
801026e4:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026e7:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026ea:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801026f1:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
801026f4:	8b 50 20             	mov    0x20(%eax),%edx
801026f7:	89 f6                	mov    %esi,%esi
801026f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
80102700:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
80102706:	80 e6 10             	and    $0x10,%dh
80102709:	75 f5                	jne    80102700 <lapicinit+0xc0>
  lapic[index] = value;
8010270b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80102712:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102715:	8b 40 20             	mov    0x20(%eax),%eax
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
80102718:	5d                   	pop    %ebp
80102719:	c3                   	ret    
8010271a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  lapic[index] = value;
80102720:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102727:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010272a:	8b 50 20             	mov    0x20(%eax),%edx
8010272d:	e9 77 ff ff ff       	jmp    801026a9 <lapicinit+0x69>
80102732:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102740 <lapicid>:

int
lapicid(void)
{
  if (!lapic)
80102740:	8b 15 7c 26 11 80    	mov    0x8011267c,%edx
{
80102746:	55                   	push   %ebp
80102747:	31 c0                	xor    %eax,%eax
80102749:	89 e5                	mov    %esp,%ebp
  if (!lapic)
8010274b:	85 d2                	test   %edx,%edx
8010274d:	74 06                	je     80102755 <lapicid+0x15>
    return 0;
  return lapic[ID] >> 24;
8010274f:	8b 42 20             	mov    0x20(%edx),%eax
80102752:	c1 e8 18             	shr    $0x18,%eax
}
80102755:	5d                   	pop    %ebp
80102756:	c3                   	ret    
80102757:	89 f6                	mov    %esi,%esi
80102759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102760 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
80102760:	a1 7c 26 11 80       	mov    0x8011267c,%eax
{
80102765:	55                   	push   %ebp
80102766:	89 e5                	mov    %esp,%ebp
  if(lapic)
80102768:	85 c0                	test   %eax,%eax
8010276a:	74 0d                	je     80102779 <lapiceoi+0x19>
  lapic[index] = value;
8010276c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102773:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102776:	8b 40 20             	mov    0x20(%eax),%eax
    lapicw(EOI, 0);
}
80102779:	5d                   	pop    %ebp
8010277a:	c3                   	ret    
8010277b:	90                   	nop
8010277c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102780 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
80102780:	55                   	push   %ebp
80102781:	89 e5                	mov    %esp,%ebp
}
80102783:	5d                   	pop    %ebp
80102784:	c3                   	ret    
80102785:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102790 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
80102790:	55                   	push   %ebp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102791:	b8 0f 00 00 00       	mov    $0xf,%eax
80102796:	ba 70 00 00 00       	mov    $0x70,%edx
8010279b:	89 e5                	mov    %esp,%ebp
8010279d:	53                   	push   %ebx
8010279e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801027a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801027a4:	ee                   	out    %al,(%dx)
801027a5:	b8 0a 00 00 00       	mov    $0xa,%eax
801027aa:	ba 71 00 00 00       	mov    $0x71,%edx
801027af:	ee                   	out    %al,(%dx)
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
801027b0:	31 c0                	xor    %eax,%eax
  wrv[1] = addr >> 4;

  // "Universal startup algorithm."
  // Send INIT (level-triggered) interrupt to reset other CPU.
  lapicw(ICRHI, apicid<<24);
801027b2:	c1 e3 18             	shl    $0x18,%ebx
  wrv[0] = 0;
801027b5:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
801027bb:	89 c8                	mov    %ecx,%eax
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
801027bd:	c1 e9 0c             	shr    $0xc,%ecx
  wrv[1] = addr >> 4;
801027c0:	c1 e8 04             	shr    $0x4,%eax
  lapicw(ICRHI, apicid<<24);
801027c3:	89 da                	mov    %ebx,%edx
    lapicw(ICRLO, STARTUP | (addr>>12));
801027c5:	80 cd 06             	or     $0x6,%ch
  wrv[1] = addr >> 4;
801027c8:	66 a3 69 04 00 80    	mov    %ax,0x80000469
  lapic[index] = value;
801027ce:	a1 7c 26 11 80       	mov    0x8011267c,%eax
801027d3:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027d9:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
801027dc:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
801027e3:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027e6:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
801027e9:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801027f0:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027f3:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
801027f6:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027fc:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
801027ff:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102805:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102808:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
8010280e:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102811:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102817:	8b 40 20             	mov    0x20(%eax),%eax
    microdelay(200);
  }
}
8010281a:	5b                   	pop    %ebx
8010281b:	5d                   	pop    %ebp
8010281c:	c3                   	ret    
8010281d:	8d 76 00             	lea    0x0(%esi),%esi

80102820 <cmostime>:
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void
cmostime(struct rtcdate *r)
{
80102820:	55                   	push   %ebp
80102821:	b8 0b 00 00 00       	mov    $0xb,%eax
80102826:	ba 70 00 00 00       	mov    $0x70,%edx
8010282b:	89 e5                	mov    %esp,%ebp
8010282d:	57                   	push   %edi
8010282e:	56                   	push   %esi
8010282f:	53                   	push   %ebx
80102830:	83 ec 4c             	sub    $0x4c,%esp
80102833:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102834:	ba 71 00 00 00       	mov    $0x71,%edx
80102839:	ec                   	in     (%dx),%al
8010283a:	83 e0 04             	and    $0x4,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010283d:	bb 70 00 00 00       	mov    $0x70,%ebx
80102842:	88 45 b3             	mov    %al,-0x4d(%ebp)
80102845:	8d 76 00             	lea    0x0(%esi),%esi
80102848:	31 c0                	xor    %eax,%eax
8010284a:	89 da                	mov    %ebx,%edx
8010284c:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010284d:	b9 71 00 00 00       	mov    $0x71,%ecx
80102852:	89 ca                	mov    %ecx,%edx
80102854:	ec                   	in     (%dx),%al
80102855:	88 45 b7             	mov    %al,-0x49(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102858:	89 da                	mov    %ebx,%edx
8010285a:	b8 02 00 00 00       	mov    $0x2,%eax
8010285f:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102860:	89 ca                	mov    %ecx,%edx
80102862:	ec                   	in     (%dx),%al
80102863:	88 45 b6             	mov    %al,-0x4a(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102866:	89 da                	mov    %ebx,%edx
80102868:	b8 04 00 00 00       	mov    $0x4,%eax
8010286d:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010286e:	89 ca                	mov    %ecx,%edx
80102870:	ec                   	in     (%dx),%al
80102871:	88 45 b5             	mov    %al,-0x4b(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102874:	89 da                	mov    %ebx,%edx
80102876:	b8 07 00 00 00       	mov    $0x7,%eax
8010287b:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010287c:	89 ca                	mov    %ecx,%edx
8010287e:	ec                   	in     (%dx),%al
8010287f:	88 45 b4             	mov    %al,-0x4c(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102882:	89 da                	mov    %ebx,%edx
80102884:	b8 08 00 00 00       	mov    $0x8,%eax
80102889:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010288a:	89 ca                	mov    %ecx,%edx
8010288c:	ec                   	in     (%dx),%al
8010288d:	89 c7                	mov    %eax,%edi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010288f:	89 da                	mov    %ebx,%edx
80102891:	b8 09 00 00 00       	mov    $0x9,%eax
80102896:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102897:	89 ca                	mov    %ecx,%edx
80102899:	ec                   	in     (%dx),%al
8010289a:	89 c6                	mov    %eax,%esi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010289c:	89 da                	mov    %ebx,%edx
8010289e:	b8 0a 00 00 00       	mov    $0xa,%eax
801028a3:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028a4:	89 ca                	mov    %ecx,%edx
801028a6:	ec                   	in     (%dx),%al
  bcd = (sb & (1 << 2)) == 0;

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
801028a7:	84 c0                	test   %al,%al
801028a9:	78 9d                	js     80102848 <cmostime+0x28>
  return inb(CMOS_RETURN);
801028ab:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
801028af:	89 fa                	mov    %edi,%edx
801028b1:	0f b6 fa             	movzbl %dl,%edi
801028b4:	89 f2                	mov    %esi,%edx
801028b6:	0f b6 f2             	movzbl %dl,%esi
801028b9:	89 7d c8             	mov    %edi,-0x38(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028bc:	89 da                	mov    %ebx,%edx
801028be:	89 75 cc             	mov    %esi,-0x34(%ebp)
801028c1:	89 45 b8             	mov    %eax,-0x48(%ebp)
801028c4:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
801028c8:	89 45 bc             	mov    %eax,-0x44(%ebp)
801028cb:	0f b6 45 b5          	movzbl -0x4b(%ebp),%eax
801028cf:	89 45 c0             	mov    %eax,-0x40(%ebp)
801028d2:	0f b6 45 b4          	movzbl -0x4c(%ebp),%eax
801028d6:	89 45 c4             	mov    %eax,-0x3c(%ebp)
801028d9:	31 c0                	xor    %eax,%eax
801028db:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028dc:	89 ca                	mov    %ecx,%edx
801028de:	ec                   	in     (%dx),%al
801028df:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028e2:	89 da                	mov    %ebx,%edx
801028e4:	89 45 d0             	mov    %eax,-0x30(%ebp)
801028e7:	b8 02 00 00 00       	mov    $0x2,%eax
801028ec:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028ed:	89 ca                	mov    %ecx,%edx
801028ef:	ec                   	in     (%dx),%al
801028f0:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028f3:	89 da                	mov    %ebx,%edx
801028f5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
801028f8:	b8 04 00 00 00       	mov    $0x4,%eax
801028fd:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028fe:	89 ca                	mov    %ecx,%edx
80102900:	ec                   	in     (%dx),%al
80102901:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102904:	89 da                	mov    %ebx,%edx
80102906:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102909:	b8 07 00 00 00       	mov    $0x7,%eax
8010290e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010290f:	89 ca                	mov    %ecx,%edx
80102911:	ec                   	in     (%dx),%al
80102912:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102915:	89 da                	mov    %ebx,%edx
80102917:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010291a:	b8 08 00 00 00       	mov    $0x8,%eax
8010291f:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102920:	89 ca                	mov    %ecx,%edx
80102922:	ec                   	in     (%dx),%al
80102923:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102926:	89 da                	mov    %ebx,%edx
80102928:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010292b:	b8 09 00 00 00       	mov    $0x9,%eax
80102930:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102931:	89 ca                	mov    %ecx,%edx
80102933:	ec                   	in     (%dx),%al
80102934:	0f b6 c0             	movzbl %al,%eax
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
80102937:	83 ec 04             	sub    $0x4,%esp
  return inb(CMOS_RETURN);
8010293a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
8010293d:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102940:	6a 18                	push   $0x18
80102942:	50                   	push   %eax
80102943:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102946:	50                   	push   %eax
80102947:	e8 e4 1b 00 00       	call   80104530 <memcmp>
8010294c:	83 c4 10             	add    $0x10,%esp
8010294f:	85 c0                	test   %eax,%eax
80102951:	0f 85 f1 fe ff ff    	jne    80102848 <cmostime+0x28>
      break;
  }

  // convert
  if(bcd) {
80102957:	80 7d b3 00          	cmpb   $0x0,-0x4d(%ebp)
8010295b:	75 78                	jne    801029d5 <cmostime+0x1b5>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
8010295d:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102960:	89 c2                	mov    %eax,%edx
80102962:	83 e0 0f             	and    $0xf,%eax
80102965:	c1 ea 04             	shr    $0x4,%edx
80102968:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010296b:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010296e:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
80102971:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102974:	89 c2                	mov    %eax,%edx
80102976:	83 e0 0f             	and    $0xf,%eax
80102979:	c1 ea 04             	shr    $0x4,%edx
8010297c:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010297f:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102982:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
80102985:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102988:	89 c2                	mov    %eax,%edx
8010298a:	83 e0 0f             	and    $0xf,%eax
8010298d:	c1 ea 04             	shr    $0x4,%edx
80102990:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102993:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102996:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
80102999:	8b 45 c4             	mov    -0x3c(%ebp),%eax
8010299c:	89 c2                	mov    %eax,%edx
8010299e:	83 e0 0f             	and    $0xf,%eax
801029a1:	c1 ea 04             	shr    $0x4,%edx
801029a4:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029a7:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029aa:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
801029ad:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029b0:	89 c2                	mov    %eax,%edx
801029b2:	83 e0 0f             	and    $0xf,%eax
801029b5:	c1 ea 04             	shr    $0x4,%edx
801029b8:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029bb:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029be:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
801029c1:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029c4:	89 c2                	mov    %eax,%edx
801029c6:	83 e0 0f             	and    $0xf,%eax
801029c9:	c1 ea 04             	shr    $0x4,%edx
801029cc:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029cf:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029d2:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
801029d5:	8b 75 08             	mov    0x8(%ebp),%esi
801029d8:	8b 45 b8             	mov    -0x48(%ebp),%eax
801029db:	89 06                	mov    %eax,(%esi)
801029dd:	8b 45 bc             	mov    -0x44(%ebp),%eax
801029e0:	89 46 04             	mov    %eax,0x4(%esi)
801029e3:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029e6:	89 46 08             	mov    %eax,0x8(%esi)
801029e9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029ec:	89 46 0c             	mov    %eax,0xc(%esi)
801029ef:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029f2:	89 46 10             	mov    %eax,0x10(%esi)
801029f5:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029f8:	89 46 14             	mov    %eax,0x14(%esi)
  r->year += 2000;
801029fb:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
}
80102a02:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a05:	5b                   	pop    %ebx
80102a06:	5e                   	pop    %esi
80102a07:	5f                   	pop    %edi
80102a08:	5d                   	pop    %ebp
80102a09:	c3                   	ret    
80102a0a:	66 90                	xchg   %ax,%ax
80102a0c:	66 90                	xchg   %ax,%ax
80102a0e:	66 90                	xchg   %ax,%ax

80102a10 <install_trans>:
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102a10:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102a16:	85 c9                	test   %ecx,%ecx
80102a18:	0f 8e 8a 00 00 00    	jle    80102aa8 <install_trans+0x98>
{
80102a1e:	55                   	push   %ebp
80102a1f:	89 e5                	mov    %esp,%ebp
80102a21:	57                   	push   %edi
80102a22:	56                   	push   %esi
80102a23:	53                   	push   %ebx
  for (tail = 0; tail < log.lh.n; tail++) {
80102a24:	31 db                	xor    %ebx,%ebx
{
80102a26:	83 ec 0c             	sub    $0xc,%esp
80102a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
80102a30:	a1 b4 26 11 80       	mov    0x801126b4,%eax
80102a35:	83 ec 08             	sub    $0x8,%esp
80102a38:	01 d8                	add    %ebx,%eax
80102a3a:	83 c0 01             	add    $0x1,%eax
80102a3d:	50                   	push   %eax
80102a3e:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102a44:	e8 87 d6 ff ff       	call   801000d0 <bread>
80102a49:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102a4b:	58                   	pop    %eax
80102a4c:	5a                   	pop    %edx
80102a4d:	ff 34 9d cc 26 11 80 	pushl  -0x7feed934(,%ebx,4)
80102a54:	ff 35 c4 26 11 80    	pushl  0x801126c4
  for (tail = 0; tail < log.lh.n; tail++) {
80102a5a:	83 c3 01             	add    $0x1,%ebx
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102a5d:	e8 6e d6 ff ff       	call   801000d0 <bread>
80102a62:	89 c6                	mov    %eax,%esi
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102a64:	8d 47 5c             	lea    0x5c(%edi),%eax
80102a67:	83 c4 0c             	add    $0xc,%esp
80102a6a:	68 00 02 00 00       	push   $0x200
80102a6f:	50                   	push   %eax
80102a70:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a73:	50                   	push   %eax
80102a74:	e8 17 1b 00 00       	call   80104590 <memmove>
    bwrite(dbuf);  // write dst to disk
80102a79:	89 34 24             	mov    %esi,(%esp)
80102a7c:	e8 1f d7 ff ff       	call   801001a0 <bwrite>
    brelse(lbuf);
80102a81:	89 3c 24             	mov    %edi,(%esp)
80102a84:	e8 57 d7 ff ff       	call   801001e0 <brelse>
    brelse(dbuf);
80102a89:	89 34 24             	mov    %esi,(%esp)
80102a8c:	e8 4f d7 ff ff       	call   801001e0 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80102a91:	83 c4 10             	add    $0x10,%esp
80102a94:	39 1d c8 26 11 80    	cmp    %ebx,0x801126c8
80102a9a:	7f 94                	jg     80102a30 <install_trans+0x20>
  }
}
80102a9c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a9f:	5b                   	pop    %ebx
80102aa0:	5e                   	pop    %esi
80102aa1:	5f                   	pop    %edi
80102aa2:	5d                   	pop    %ebp
80102aa3:	c3                   	ret    
80102aa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102aa8:	f3 c3                	repz ret 
80102aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102ab0 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102ab0:	55                   	push   %ebp
80102ab1:	89 e5                	mov    %esp,%ebp
80102ab3:	56                   	push   %esi
80102ab4:	53                   	push   %ebx
  struct buf *buf = bread(log.dev, log.start);
80102ab5:	83 ec 08             	sub    $0x8,%esp
80102ab8:	ff 35 b4 26 11 80    	pushl  0x801126b4
80102abe:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102ac4:	e8 07 d6 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102ac9:	8b 1d c8 26 11 80    	mov    0x801126c8,%ebx
  for (i = 0; i < log.lh.n; i++) {
80102acf:	83 c4 10             	add    $0x10,%esp
  struct buf *buf = bread(log.dev, log.start);
80102ad2:	89 c6                	mov    %eax,%esi
  for (i = 0; i < log.lh.n; i++) {
80102ad4:	85 db                	test   %ebx,%ebx
  hb->n = log.lh.n;
80102ad6:	89 58 5c             	mov    %ebx,0x5c(%eax)
  for (i = 0; i < log.lh.n; i++) {
80102ad9:	7e 16                	jle    80102af1 <write_head+0x41>
80102adb:	c1 e3 02             	shl    $0x2,%ebx
80102ade:	31 d2                	xor    %edx,%edx
    hb->block[i] = log.lh.block[i];
80102ae0:	8b 8a cc 26 11 80    	mov    -0x7feed934(%edx),%ecx
80102ae6:	89 4c 16 60          	mov    %ecx,0x60(%esi,%edx,1)
80102aea:	83 c2 04             	add    $0x4,%edx
  for (i = 0; i < log.lh.n; i++) {
80102aed:	39 da                	cmp    %ebx,%edx
80102aef:	75 ef                	jne    80102ae0 <write_head+0x30>
  }
  bwrite(buf);
80102af1:	83 ec 0c             	sub    $0xc,%esp
80102af4:	56                   	push   %esi
80102af5:	e8 a6 d6 ff ff       	call   801001a0 <bwrite>
  brelse(buf);
80102afa:	89 34 24             	mov    %esi,(%esp)
80102afd:	e8 de d6 ff ff       	call   801001e0 <brelse>
}
80102b02:	83 c4 10             	add    $0x10,%esp
80102b05:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102b08:	5b                   	pop    %ebx
80102b09:	5e                   	pop    %esi
80102b0a:	5d                   	pop    %ebp
80102b0b:	c3                   	ret    
80102b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102b10 <initlog>:
{
80102b10:	55                   	push   %ebp
80102b11:	89 e5                	mov    %esp,%ebp
80102b13:	53                   	push   %ebx
80102b14:	83 ec 2c             	sub    $0x2c,%esp
80102b17:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&log.lock, "log");
80102b1a:	68 a0 77 10 80       	push   $0x801077a0
80102b1f:	68 80 26 11 80       	push   $0x80112680
80102b24:	e8 67 17 00 00       	call   80104290 <initlock>
  readsb(dev, &sb);
80102b29:	58                   	pop    %eax
80102b2a:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102b2d:	5a                   	pop    %edx
80102b2e:	50                   	push   %eax
80102b2f:	53                   	push   %ebx
80102b30:	e8 9b e8 ff ff       	call   801013d0 <readsb>
  log.size = sb.nlog;
80102b35:	8b 55 e8             	mov    -0x18(%ebp),%edx
  log.start = sb.logstart;
80102b38:	8b 45 ec             	mov    -0x14(%ebp),%eax
  struct buf *buf = bread(log.dev, log.start);
80102b3b:	59                   	pop    %ecx
  log.dev = dev;
80102b3c:	89 1d c4 26 11 80    	mov    %ebx,0x801126c4
  log.size = sb.nlog;
80102b42:	89 15 b8 26 11 80    	mov    %edx,0x801126b8
  log.start = sb.logstart;
80102b48:	a3 b4 26 11 80       	mov    %eax,0x801126b4
  struct buf *buf = bread(log.dev, log.start);
80102b4d:	5a                   	pop    %edx
80102b4e:	50                   	push   %eax
80102b4f:	53                   	push   %ebx
80102b50:	e8 7b d5 ff ff       	call   801000d0 <bread>
  log.lh.n = lh->n;
80102b55:	8b 58 5c             	mov    0x5c(%eax),%ebx
  for (i = 0; i < log.lh.n; i++) {
80102b58:	83 c4 10             	add    $0x10,%esp
80102b5b:	85 db                	test   %ebx,%ebx
  log.lh.n = lh->n;
80102b5d:	89 1d c8 26 11 80    	mov    %ebx,0x801126c8
  for (i = 0; i < log.lh.n; i++) {
80102b63:	7e 1c                	jle    80102b81 <initlog+0x71>
80102b65:	c1 e3 02             	shl    $0x2,%ebx
80102b68:	31 d2                	xor    %edx,%edx
80102b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    log.lh.block[i] = lh->block[i];
80102b70:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102b74:	83 c2 04             	add    $0x4,%edx
80102b77:	89 8a c8 26 11 80    	mov    %ecx,-0x7feed938(%edx)
  for (i = 0; i < log.lh.n; i++) {
80102b7d:	39 d3                	cmp    %edx,%ebx
80102b7f:	75 ef                	jne    80102b70 <initlog+0x60>
  brelse(buf);
80102b81:	83 ec 0c             	sub    $0xc,%esp
80102b84:	50                   	push   %eax
80102b85:	e8 56 d6 ff ff       	call   801001e0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102b8a:	e8 81 fe ff ff       	call   80102a10 <install_trans>
  log.lh.n = 0;
80102b8f:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102b96:	00 00 00 
  write_head(); // clear the log
80102b99:	e8 12 ff ff ff       	call   80102ab0 <write_head>
}
80102b9e:	83 c4 10             	add    $0x10,%esp
80102ba1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102ba4:	c9                   	leave  
80102ba5:	c3                   	ret    
80102ba6:	8d 76 00             	lea    0x0(%esi),%esi
80102ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102bb0 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102bb0:	55                   	push   %ebp
80102bb1:	89 e5                	mov    %esp,%ebp
80102bb3:	83 ec 14             	sub    $0x14,%esp
  acquire(&log.lock);
80102bb6:	68 80 26 11 80       	push   $0x80112680
80102bbb:	e8 10 18 00 00       	call   801043d0 <acquire>
80102bc0:	83 c4 10             	add    $0x10,%esp
80102bc3:	eb 18                	jmp    80102bdd <begin_op+0x2d>
80102bc5:	8d 76 00             	lea    0x0(%esi),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102bc8:	83 ec 08             	sub    $0x8,%esp
80102bcb:	68 80 26 11 80       	push   $0x80112680
80102bd0:	68 80 26 11 80       	push   $0x80112680
80102bd5:	e8 16 12 00 00       	call   80103df0 <sleep>
80102bda:	83 c4 10             	add    $0x10,%esp
    if(log.committing){
80102bdd:	a1 c0 26 11 80       	mov    0x801126c0,%eax
80102be2:	85 c0                	test   %eax,%eax
80102be4:	75 e2                	jne    80102bc8 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102be6:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102beb:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102bf1:	83 c0 01             	add    $0x1,%eax
80102bf4:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102bf7:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102bfa:	83 fa 1e             	cmp    $0x1e,%edx
80102bfd:	7f c9                	jg     80102bc8 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102bff:	83 ec 0c             	sub    $0xc,%esp
      log.outstanding += 1;
80102c02:	a3 bc 26 11 80       	mov    %eax,0x801126bc
      release(&log.lock);
80102c07:	68 80 26 11 80       	push   $0x80112680
80102c0c:	e8 7f 18 00 00       	call   80104490 <release>
      break;
    }
  }
}
80102c11:	83 c4 10             	add    $0x10,%esp
80102c14:	c9                   	leave  
80102c15:	c3                   	ret    
80102c16:	8d 76 00             	lea    0x0(%esi),%esi
80102c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c20 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102c20:	55                   	push   %ebp
80102c21:	89 e5                	mov    %esp,%ebp
80102c23:	57                   	push   %edi
80102c24:	56                   	push   %esi
80102c25:	53                   	push   %ebx
80102c26:	83 ec 18             	sub    $0x18,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102c29:	68 80 26 11 80       	push   $0x80112680
80102c2e:	e8 9d 17 00 00       	call   801043d0 <acquire>
  log.outstanding -= 1;
80102c33:	a1 bc 26 11 80       	mov    0x801126bc,%eax
  if(log.committing)
80102c38:	8b 35 c0 26 11 80    	mov    0x801126c0,%esi
80102c3e:	83 c4 10             	add    $0x10,%esp
  log.outstanding -= 1;
80102c41:	8d 58 ff             	lea    -0x1(%eax),%ebx
  if(log.committing)
80102c44:	85 f6                	test   %esi,%esi
  log.outstanding -= 1;
80102c46:	89 1d bc 26 11 80    	mov    %ebx,0x801126bc
  if(log.committing)
80102c4c:	0f 85 1a 01 00 00    	jne    80102d6c <end_op+0x14c>
    panic("log.committing");
  if(log.outstanding == 0){
80102c52:	85 db                	test   %ebx,%ebx
80102c54:	0f 85 ee 00 00 00    	jne    80102d48 <end_op+0x128>
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
  }
  release(&log.lock);
80102c5a:	83 ec 0c             	sub    $0xc,%esp
    log.committing = 1;
80102c5d:	c7 05 c0 26 11 80 01 	movl   $0x1,0x801126c0
80102c64:	00 00 00 
  release(&log.lock);
80102c67:	68 80 26 11 80       	push   $0x80112680
80102c6c:	e8 1f 18 00 00       	call   80104490 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102c71:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102c77:	83 c4 10             	add    $0x10,%esp
80102c7a:	85 c9                	test   %ecx,%ecx
80102c7c:	0f 8e 85 00 00 00    	jle    80102d07 <end_op+0xe7>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102c82:	a1 b4 26 11 80       	mov    0x801126b4,%eax
80102c87:	83 ec 08             	sub    $0x8,%esp
80102c8a:	01 d8                	add    %ebx,%eax
80102c8c:	83 c0 01             	add    $0x1,%eax
80102c8f:	50                   	push   %eax
80102c90:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102c96:	e8 35 d4 ff ff       	call   801000d0 <bread>
80102c9b:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c9d:	58                   	pop    %eax
80102c9e:	5a                   	pop    %edx
80102c9f:	ff 34 9d cc 26 11 80 	pushl  -0x7feed934(,%ebx,4)
80102ca6:	ff 35 c4 26 11 80    	pushl  0x801126c4
  for (tail = 0; tail < log.lh.n; tail++) {
80102cac:	83 c3 01             	add    $0x1,%ebx
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102caf:	e8 1c d4 ff ff       	call   801000d0 <bread>
80102cb4:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102cb6:	8d 40 5c             	lea    0x5c(%eax),%eax
80102cb9:	83 c4 0c             	add    $0xc,%esp
80102cbc:	68 00 02 00 00       	push   $0x200
80102cc1:	50                   	push   %eax
80102cc2:	8d 46 5c             	lea    0x5c(%esi),%eax
80102cc5:	50                   	push   %eax
80102cc6:	e8 c5 18 00 00       	call   80104590 <memmove>
    bwrite(to);  // write the log
80102ccb:	89 34 24             	mov    %esi,(%esp)
80102cce:	e8 cd d4 ff ff       	call   801001a0 <bwrite>
    brelse(from);
80102cd3:	89 3c 24             	mov    %edi,(%esp)
80102cd6:	e8 05 d5 ff ff       	call   801001e0 <brelse>
    brelse(to);
80102cdb:	89 34 24             	mov    %esi,(%esp)
80102cde:	e8 fd d4 ff ff       	call   801001e0 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80102ce3:	83 c4 10             	add    $0x10,%esp
80102ce6:	3b 1d c8 26 11 80    	cmp    0x801126c8,%ebx
80102cec:	7c 94                	jl     80102c82 <end_op+0x62>
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102cee:	e8 bd fd ff ff       	call   80102ab0 <write_head>
    install_trans(); // Now install writes to home locations
80102cf3:	e8 18 fd ff ff       	call   80102a10 <install_trans>
    log.lh.n = 0;
80102cf8:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102cff:	00 00 00 
    write_head();    // Erase the transaction from the log
80102d02:	e8 a9 fd ff ff       	call   80102ab0 <write_head>
    acquire(&log.lock);
80102d07:	83 ec 0c             	sub    $0xc,%esp
80102d0a:	68 80 26 11 80       	push   $0x80112680
80102d0f:	e8 bc 16 00 00       	call   801043d0 <acquire>
    wakeup(&log);
80102d14:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
    log.committing = 0;
80102d1b:	c7 05 c0 26 11 80 00 	movl   $0x0,0x801126c0
80102d22:	00 00 00 
    wakeup(&log);
80102d25:	e8 86 12 00 00       	call   80103fb0 <wakeup>
    release(&log.lock);
80102d2a:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102d31:	e8 5a 17 00 00       	call   80104490 <release>
80102d36:	83 c4 10             	add    $0x10,%esp
}
80102d39:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d3c:	5b                   	pop    %ebx
80102d3d:	5e                   	pop    %esi
80102d3e:	5f                   	pop    %edi
80102d3f:	5d                   	pop    %ebp
80102d40:	c3                   	ret    
80102d41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wakeup(&log);
80102d48:	83 ec 0c             	sub    $0xc,%esp
80102d4b:	68 80 26 11 80       	push   $0x80112680
80102d50:	e8 5b 12 00 00       	call   80103fb0 <wakeup>
  release(&log.lock);
80102d55:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102d5c:	e8 2f 17 00 00       	call   80104490 <release>
80102d61:	83 c4 10             	add    $0x10,%esp
}
80102d64:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d67:	5b                   	pop    %ebx
80102d68:	5e                   	pop    %esi
80102d69:	5f                   	pop    %edi
80102d6a:	5d                   	pop    %ebp
80102d6b:	c3                   	ret    
    panic("log.committing");
80102d6c:	83 ec 0c             	sub    $0xc,%esp
80102d6f:	68 a4 77 10 80       	push   $0x801077a4
80102d74:	e8 17 d6 ff ff       	call   80100390 <panic>
80102d79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102d80 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102d80:	55                   	push   %ebp
80102d81:	89 e5                	mov    %esp,%ebp
80102d83:	53                   	push   %ebx
80102d84:	83 ec 04             	sub    $0x4,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d87:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
{
80102d8d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d90:	83 fa 1d             	cmp    $0x1d,%edx
80102d93:	0f 8f 9d 00 00 00    	jg     80102e36 <log_write+0xb6>
80102d99:	a1 b8 26 11 80       	mov    0x801126b8,%eax
80102d9e:	83 e8 01             	sub    $0x1,%eax
80102da1:	39 c2                	cmp    %eax,%edx
80102da3:	0f 8d 8d 00 00 00    	jge    80102e36 <log_write+0xb6>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102da9:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102dae:	85 c0                	test   %eax,%eax
80102db0:	0f 8e 8d 00 00 00    	jle    80102e43 <log_write+0xc3>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102db6:	83 ec 0c             	sub    $0xc,%esp
80102db9:	68 80 26 11 80       	push   $0x80112680
80102dbe:	e8 0d 16 00 00       	call   801043d0 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102dc3:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102dc9:	83 c4 10             	add    $0x10,%esp
80102dcc:	83 f9 00             	cmp    $0x0,%ecx
80102dcf:	7e 57                	jle    80102e28 <log_write+0xa8>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102dd1:	8b 53 08             	mov    0x8(%ebx),%edx
  for (i = 0; i < log.lh.n; i++) {
80102dd4:	31 c0                	xor    %eax,%eax
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102dd6:	3b 15 cc 26 11 80    	cmp    0x801126cc,%edx
80102ddc:	75 0b                	jne    80102de9 <log_write+0x69>
80102dde:	eb 38                	jmp    80102e18 <log_write+0x98>
80102de0:	39 14 85 cc 26 11 80 	cmp    %edx,-0x7feed934(,%eax,4)
80102de7:	74 2f                	je     80102e18 <log_write+0x98>
  for (i = 0; i < log.lh.n; i++) {
80102de9:	83 c0 01             	add    $0x1,%eax
80102dec:	39 c1                	cmp    %eax,%ecx
80102dee:	75 f0                	jne    80102de0 <log_write+0x60>
      break;
  }
  log.lh.block[i] = b->blockno;
80102df0:	89 14 85 cc 26 11 80 	mov    %edx,-0x7feed934(,%eax,4)
  if (i == log.lh.n)
    log.lh.n++;
80102df7:	83 c0 01             	add    $0x1,%eax
80102dfa:	a3 c8 26 11 80       	mov    %eax,0x801126c8
  b->flags |= B_DIRTY; // prevent eviction
80102dff:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80102e02:	c7 45 08 80 26 11 80 	movl   $0x80112680,0x8(%ebp)
}
80102e09:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102e0c:	c9                   	leave  
  release(&log.lock);
80102e0d:	e9 7e 16 00 00       	jmp    80104490 <release>
80102e12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  log.lh.block[i] = b->blockno;
80102e18:	89 14 85 cc 26 11 80 	mov    %edx,-0x7feed934(,%eax,4)
80102e1f:	eb de                	jmp    80102dff <log_write+0x7f>
80102e21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102e28:	8b 43 08             	mov    0x8(%ebx),%eax
80102e2b:	a3 cc 26 11 80       	mov    %eax,0x801126cc
  if (i == log.lh.n)
80102e30:	75 cd                	jne    80102dff <log_write+0x7f>
80102e32:	31 c0                	xor    %eax,%eax
80102e34:	eb c1                	jmp    80102df7 <log_write+0x77>
    panic("too big a transaction");
80102e36:	83 ec 0c             	sub    $0xc,%esp
80102e39:	68 b3 77 10 80       	push   $0x801077b3
80102e3e:	e8 4d d5 ff ff       	call   80100390 <panic>
    panic("log_write outside of trans");
80102e43:	83 ec 0c             	sub    $0xc,%esp
80102e46:	68 c9 77 10 80       	push   $0x801077c9
80102e4b:	e8 40 d5 ff ff       	call   80100390 <panic>

80102e50 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102e50:	55                   	push   %ebp
80102e51:	89 e5                	mov    %esp,%ebp
80102e53:	53                   	push   %ebx
80102e54:	83 ec 04             	sub    $0x4,%esp
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
80102e57:	e8 d4 09 00 00       	call   80103830 <cpuid>
80102e5c:	89 c3                	mov    %eax,%ebx
80102e5e:	e8 cd 09 00 00       	call   80103830 <cpuid>
80102e63:	83 ec 04             	sub    $0x4,%esp
80102e66:	53                   	push   %ebx
80102e67:	50                   	push   %eax
80102e68:	68 e4 77 10 80       	push   $0x801077e4
80102e6d:	e8 ee d7 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80102e72:	e8 f9 29 00 00       	call   80105870 <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
80102e77:	e8 34 09 00 00       	call   801037b0 <mycpu>
80102e7c:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102e7e:	b8 01 00 00 00       	mov    $0x1,%eax
80102e83:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
80102e8a:	e8 81 0c 00 00       	call   80103b10 <scheduler>
80102e8f:	90                   	nop

80102e90 <mpenter>:
{
80102e90:	55                   	push   %ebp
80102e91:	89 e5                	mov    %esp,%ebp
80102e93:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102e96:	e8 65 3d 00 00       	call   80106c00 <switchkvm>
  seginit();
80102e9b:	e8 40 3c 00 00       	call   80106ae0 <seginit>
  lapicinit();
80102ea0:	e8 9b f7 ff ff       	call   80102640 <lapicinit>
  mpmain();
80102ea5:	e8 a6 ff ff ff       	call   80102e50 <mpmain>
80102eaa:	66 90                	xchg   %ax,%ax
80102eac:	66 90                	xchg   %ax,%ax
80102eae:	66 90                	xchg   %ax,%ax

80102eb0 <main>:
{
80102eb0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102eb4:	83 e4 f0             	and    $0xfffffff0,%esp
80102eb7:	ff 71 fc             	pushl  -0x4(%ecx)
80102eba:	55                   	push   %ebp
80102ebb:	89 e5                	mov    %esp,%ebp
80102ebd:	53                   	push   %ebx
80102ebe:	51                   	push   %ecx
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102ebf:	83 ec 08             	sub    $0x8,%esp
80102ec2:	68 00 00 40 80       	push   $0x80400000
80102ec7:	68 a8 5d 11 80       	push   $0x80115da8
80102ecc:	e8 2f f5 ff ff       	call   80102400 <kinit1>
  kvmalloc();      // kernel page table
80102ed1:	e8 ea 41 00 00       	call   801070c0 <kvmalloc>
  mpinit();        // detect other processors
80102ed6:	e8 75 01 00 00       	call   80103050 <mpinit>
  lapicinit();     // interrupt controller
80102edb:	e8 60 f7 ff ff       	call   80102640 <lapicinit>
  seginit();       // segment descriptors
80102ee0:	e8 fb 3b 00 00       	call   80106ae0 <seginit>
  picinit();       // disable pic
80102ee5:	e8 46 03 00 00       	call   80103230 <picinit>
  ioapicinit();    // another interrupt controller
80102eea:	e8 41 f3 ff ff       	call   80102230 <ioapicinit>
  consoleinit();   // console hardware
80102eef:	e8 cc da ff ff       	call   801009c0 <consoleinit>
  uartinit();      // serial port
80102ef4:	e8 47 2f 00 00       	call   80105e40 <uartinit>
  pinit();         // process table
80102ef9:	e8 92 08 00 00       	call   80103790 <pinit>
  tvinit();        // trap vectors
80102efe:	e8 ed 28 00 00       	call   801057f0 <tvinit>
  binit();         // buffer cache
80102f03:	e8 38 d1 ff ff       	call   80100040 <binit>
  fileinit();      // file table
80102f08:	e8 53 de ff ff       	call   80100d60 <fileinit>
  ideinit();       // disk 
80102f0d:	e8 fe f0 ff ff       	call   80102010 <ideinit>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102f12:	83 c4 0c             	add    $0xc,%esp
80102f15:	68 8a 00 00 00       	push   $0x8a
80102f1a:	68 8c a4 10 80       	push   $0x8010a48c
80102f1f:	68 00 70 00 80       	push   $0x80007000
80102f24:	e8 67 16 00 00       	call   80104590 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80102f29:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
80102f30:	00 00 00 
80102f33:	83 c4 10             	add    $0x10,%esp
80102f36:	05 80 27 11 80       	add    $0x80112780,%eax
80102f3b:	3d 80 27 11 80       	cmp    $0x80112780,%eax
80102f40:	76 71                	jbe    80102fb3 <main+0x103>
80102f42:	bb 80 27 11 80       	mov    $0x80112780,%ebx
80102f47:	89 f6                	mov    %esi,%esi
80102f49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(c == mycpu())  // We've started already.
80102f50:	e8 5b 08 00 00       	call   801037b0 <mycpu>
80102f55:	39 d8                	cmp    %ebx,%eax
80102f57:	74 41                	je     80102f9a <main+0xea>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102f59:	e8 72 f5 ff ff       	call   801024d0 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f5e:	05 00 10 00 00       	add    $0x1000,%eax
    *(void(**)(void))(code-8) = mpenter;
80102f63:	c7 05 f8 6f 00 80 90 	movl   $0x80102e90,0x80006ff8
80102f6a:	2e 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80102f6d:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102f74:	90 10 00 
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f77:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc

    lapicstartap(c->apicid, V2P(code));
80102f7c:	0f b6 03             	movzbl (%ebx),%eax
80102f7f:	83 ec 08             	sub    $0x8,%esp
80102f82:	68 00 70 00 00       	push   $0x7000
80102f87:	50                   	push   %eax
80102f88:	e8 03 f8 ff ff       	call   80102790 <lapicstartap>
80102f8d:	83 c4 10             	add    $0x10,%esp

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80102f90:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102f96:	85 c0                	test   %eax,%eax
80102f98:	74 f6                	je     80102f90 <main+0xe0>
  for(c = cpus; c < cpus+ncpu; c++){
80102f9a:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
80102fa1:	00 00 00 
80102fa4:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102faa:	05 80 27 11 80       	add    $0x80112780,%eax
80102faf:	39 c3                	cmp    %eax,%ebx
80102fb1:	72 9d                	jb     80102f50 <main+0xa0>
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80102fb3:	83 ec 08             	sub    $0x8,%esp
80102fb6:	68 00 00 00 8e       	push   $0x8e000000
80102fbb:	68 00 00 40 80       	push   $0x80400000
80102fc0:	e8 ab f4 ff ff       	call   80102470 <kinit2>
  userinit();      // first user process
80102fc5:	e8 b6 08 00 00       	call   80103880 <userinit>
  mpmain();        // finish this processor's setup
80102fca:	e8 81 fe ff ff       	call   80102e50 <mpmain>
80102fcf:	90                   	nop

80102fd0 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102fd0:	55                   	push   %ebp
80102fd1:	89 e5                	mov    %esp,%ebp
80102fd3:	57                   	push   %edi
80102fd4:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80102fd5:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
{
80102fdb:	53                   	push   %ebx
  e = addr+len;
80102fdc:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
{
80102fdf:	83 ec 0c             	sub    $0xc,%esp
  for(p = addr; p < e; p += sizeof(struct mp))
80102fe2:	39 de                	cmp    %ebx,%esi
80102fe4:	72 10                	jb     80102ff6 <mpsearch1+0x26>
80102fe6:	eb 50                	jmp    80103038 <mpsearch1+0x68>
80102fe8:	90                   	nop
80102fe9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ff0:	39 fb                	cmp    %edi,%ebx
80102ff2:	89 fe                	mov    %edi,%esi
80102ff4:	76 42                	jbe    80103038 <mpsearch1+0x68>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102ff6:	83 ec 04             	sub    $0x4,%esp
80102ff9:	8d 7e 10             	lea    0x10(%esi),%edi
80102ffc:	6a 04                	push   $0x4
80102ffe:	68 f8 77 10 80       	push   $0x801077f8
80103003:	56                   	push   %esi
80103004:	e8 27 15 00 00       	call   80104530 <memcmp>
80103009:	83 c4 10             	add    $0x10,%esp
8010300c:	85 c0                	test   %eax,%eax
8010300e:	75 e0                	jne    80102ff0 <mpsearch1+0x20>
80103010:	89 f1                	mov    %esi,%ecx
80103012:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    sum += addr[i];
80103018:	0f b6 11             	movzbl (%ecx),%edx
8010301b:	83 c1 01             	add    $0x1,%ecx
8010301e:	01 d0                	add    %edx,%eax
  for(i=0; i<len; i++)
80103020:	39 f9                	cmp    %edi,%ecx
80103022:	75 f4                	jne    80103018 <mpsearch1+0x48>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80103024:	84 c0                	test   %al,%al
80103026:	75 c8                	jne    80102ff0 <mpsearch1+0x20>
      return (struct mp*)p;
  return 0;
}
80103028:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010302b:	89 f0                	mov    %esi,%eax
8010302d:	5b                   	pop    %ebx
8010302e:	5e                   	pop    %esi
8010302f:	5f                   	pop    %edi
80103030:	5d                   	pop    %ebp
80103031:	c3                   	ret    
80103032:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103038:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
8010303b:	31 f6                	xor    %esi,%esi
}
8010303d:	89 f0                	mov    %esi,%eax
8010303f:	5b                   	pop    %ebx
80103040:	5e                   	pop    %esi
80103041:	5f                   	pop    %edi
80103042:	5d                   	pop    %ebp
80103043:	c3                   	ret    
80103044:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010304a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103050 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80103050:	55                   	push   %ebp
80103051:	89 e5                	mov    %esp,%ebp
80103053:	57                   	push   %edi
80103054:	56                   	push   %esi
80103055:	53                   	push   %ebx
80103056:	83 ec 1c             	sub    $0x1c,%esp
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80103059:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103060:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103067:	c1 e0 08             	shl    $0x8,%eax
8010306a:	09 d0                	or     %edx,%eax
8010306c:	c1 e0 04             	shl    $0x4,%eax
8010306f:	85 c0                	test   %eax,%eax
80103071:	75 1b                	jne    8010308e <mpinit+0x3e>
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
80103073:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010307a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103081:	c1 e0 08             	shl    $0x8,%eax
80103084:	09 d0                	or     %edx,%eax
80103086:	c1 e0 0a             	shl    $0xa,%eax
    if((mp = mpsearch1(p-1024, 1024)))
80103089:	2d 00 04 00 00       	sub    $0x400,%eax
    if((mp = mpsearch1(p, 1024)))
8010308e:	ba 00 04 00 00       	mov    $0x400,%edx
80103093:	e8 38 ff ff ff       	call   80102fd0 <mpsearch1>
80103098:	85 c0                	test   %eax,%eax
8010309a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010309d:	0f 84 3d 01 00 00    	je     801031e0 <mpinit+0x190>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801030a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801030a6:	8b 58 04             	mov    0x4(%eax),%ebx
801030a9:	85 db                	test   %ebx,%ebx
801030ab:	0f 84 4f 01 00 00    	je     80103200 <mpinit+0x1b0>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
801030b1:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
  if(memcmp(conf, "PCMP", 4) != 0)
801030b7:	83 ec 04             	sub    $0x4,%esp
801030ba:	6a 04                	push   $0x4
801030bc:	68 15 78 10 80       	push   $0x80107815
801030c1:	56                   	push   %esi
801030c2:	e8 69 14 00 00       	call   80104530 <memcmp>
801030c7:	83 c4 10             	add    $0x10,%esp
801030ca:	85 c0                	test   %eax,%eax
801030cc:	0f 85 2e 01 00 00    	jne    80103200 <mpinit+0x1b0>
  if(conf->version != 1 && conf->version != 4)
801030d2:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
801030d9:	3c 01                	cmp    $0x1,%al
801030db:	0f 95 c2             	setne  %dl
801030de:	3c 04                	cmp    $0x4,%al
801030e0:	0f 95 c0             	setne  %al
801030e3:	20 c2                	and    %al,%dl
801030e5:	0f 85 15 01 00 00    	jne    80103200 <mpinit+0x1b0>
  if(sum((uchar*)conf, conf->length) != 0)
801030eb:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
  for(i=0; i<len; i++)
801030f2:	66 85 ff             	test   %di,%di
801030f5:	74 1a                	je     80103111 <mpinit+0xc1>
801030f7:	89 f0                	mov    %esi,%eax
801030f9:	01 f7                	add    %esi,%edi
  sum = 0;
801030fb:	31 d2                	xor    %edx,%edx
801030fd:	8d 76 00             	lea    0x0(%esi),%esi
    sum += addr[i];
80103100:	0f b6 08             	movzbl (%eax),%ecx
80103103:	83 c0 01             	add    $0x1,%eax
80103106:	01 ca                	add    %ecx,%edx
  for(i=0; i<len; i++)
80103108:	39 c7                	cmp    %eax,%edi
8010310a:	75 f4                	jne    80103100 <mpinit+0xb0>
8010310c:	84 d2                	test   %dl,%dl
8010310e:	0f 95 c2             	setne  %dl
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
80103111:	85 f6                	test   %esi,%esi
80103113:	0f 84 e7 00 00 00    	je     80103200 <mpinit+0x1b0>
80103119:	84 d2                	test   %dl,%dl
8010311b:	0f 85 df 00 00 00    	jne    80103200 <mpinit+0x1b0>
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
80103121:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
80103127:	a3 7c 26 11 80       	mov    %eax,0x8011267c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
8010312c:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
80103133:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
  ismp = 1;
80103139:	bb 01 00 00 00       	mov    $0x1,%ebx
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
8010313e:	01 d6                	add    %edx,%esi
80103140:	39 c6                	cmp    %eax,%esi
80103142:	76 23                	jbe    80103167 <mpinit+0x117>
    switch(*p){
80103144:	0f b6 10             	movzbl (%eax),%edx
80103147:	80 fa 04             	cmp    $0x4,%dl
8010314a:	0f 87 ca 00 00 00    	ja     8010321a <mpinit+0x1ca>
80103150:	ff 24 95 3c 78 10 80 	jmp    *-0x7fef87c4(,%edx,4)
80103157:	89 f6                	mov    %esi,%esi
80103159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80103160:	83 c0 08             	add    $0x8,%eax
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103163:	39 c6                	cmp    %eax,%esi
80103165:	77 dd                	ja     80103144 <mpinit+0xf4>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp)
80103167:	85 db                	test   %ebx,%ebx
80103169:	0f 84 9e 00 00 00    	je     8010320d <mpinit+0x1bd>
    panic("Didn't find a suitable machine");

  if(mp->imcrp){
8010316f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103172:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
80103176:	74 15                	je     8010318d <mpinit+0x13d>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103178:	b8 70 00 00 00       	mov    $0x70,%eax
8010317d:	ba 22 00 00 00       	mov    $0x22,%edx
80103182:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103183:	ba 23 00 00 00       	mov    $0x23,%edx
80103188:	ec                   	in     (%dx),%al
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
80103189:	83 c8 01             	or     $0x1,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010318c:	ee                   	out    %al,(%dx)
  }
}
8010318d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103190:	5b                   	pop    %ebx
80103191:	5e                   	pop    %esi
80103192:	5f                   	pop    %edi
80103193:	5d                   	pop    %ebp
80103194:	c3                   	ret    
80103195:	8d 76 00             	lea    0x0(%esi),%esi
      if(ncpu < NCPU) {
80103198:	8b 0d 00 2d 11 80    	mov    0x80112d00,%ecx
8010319e:	83 f9 07             	cmp    $0x7,%ecx
801031a1:	7f 19                	jg     801031bc <mpinit+0x16c>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
801031a3:	0f b6 50 01          	movzbl 0x1(%eax),%edx
801031a7:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
        ncpu++;
801031ad:	83 c1 01             	add    $0x1,%ecx
801031b0:	89 0d 00 2d 11 80    	mov    %ecx,0x80112d00
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
801031b6:	88 97 80 27 11 80    	mov    %dl,-0x7feed880(%edi)
      p += sizeof(struct mpproc);
801031bc:	83 c0 14             	add    $0x14,%eax
      continue;
801031bf:	e9 7c ff ff ff       	jmp    80103140 <mpinit+0xf0>
801031c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      ioapicid = ioapic->apicno;
801031c8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
801031cc:	83 c0 08             	add    $0x8,%eax
      ioapicid = ioapic->apicno;
801031cf:	88 15 60 27 11 80    	mov    %dl,0x80112760
      continue;
801031d5:	e9 66 ff ff ff       	jmp    80103140 <mpinit+0xf0>
801031da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  return mpsearch1(0xF0000, 0x10000);
801031e0:	ba 00 00 01 00       	mov    $0x10000,%edx
801031e5:	b8 00 00 0f 00       	mov    $0xf0000,%eax
801031ea:	e8 e1 fd ff ff       	call   80102fd0 <mpsearch1>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801031ef:	85 c0                	test   %eax,%eax
  return mpsearch1(0xF0000, 0x10000);
801031f1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801031f4:	0f 85 a9 fe ff ff    	jne    801030a3 <mpinit+0x53>
801031fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    panic("Expect to run on an SMP");
80103200:	83 ec 0c             	sub    $0xc,%esp
80103203:	68 fd 77 10 80       	push   $0x801077fd
80103208:	e8 83 d1 ff ff       	call   80100390 <panic>
    panic("Didn't find a suitable machine");
8010320d:	83 ec 0c             	sub    $0xc,%esp
80103210:	68 1c 78 10 80       	push   $0x8010781c
80103215:	e8 76 d1 ff ff       	call   80100390 <panic>
      ismp = 0;
8010321a:	31 db                	xor    %ebx,%ebx
8010321c:	e9 26 ff ff ff       	jmp    80103147 <mpinit+0xf7>
80103221:	66 90                	xchg   %ax,%ax
80103223:	66 90                	xchg   %ax,%ax
80103225:	66 90                	xchg   %ax,%ax
80103227:	66 90                	xchg   %ax,%ax
80103229:	66 90                	xchg   %ax,%ax
8010322b:	66 90                	xchg   %ax,%ax
8010322d:	66 90                	xchg   %ax,%ax
8010322f:	90                   	nop

80103230 <picinit>:
#define IO_PIC2         0xA0    // Slave (IRQs 8-15)

// Don't use the 8259A interrupt controllers.  Xv6 assumes SMP hardware.
void
picinit(void)
{
80103230:	55                   	push   %ebp
80103231:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103236:	ba 21 00 00 00       	mov    $0x21,%edx
8010323b:	89 e5                	mov    %esp,%ebp
8010323d:	ee                   	out    %al,(%dx)
8010323e:	ba a1 00 00 00       	mov    $0xa1,%edx
80103243:	ee                   	out    %al,(%dx)
  // mask all interrupts
  outb(IO_PIC1+1, 0xFF);
  outb(IO_PIC2+1, 0xFF);
}
80103244:	5d                   	pop    %ebp
80103245:	c3                   	ret    
80103246:	66 90                	xchg   %ax,%ax
80103248:	66 90                	xchg   %ax,%ax
8010324a:	66 90                	xchg   %ax,%ax
8010324c:	66 90                	xchg   %ax,%ax
8010324e:	66 90                	xchg   %ax,%ax

80103250 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
80103250:	55                   	push   %ebp
80103251:	89 e5                	mov    %esp,%ebp
80103253:	57                   	push   %edi
80103254:	56                   	push   %esi
80103255:	53                   	push   %ebx
80103256:	83 ec 0c             	sub    $0xc,%esp
80103259:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010325c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
8010325f:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80103265:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
8010326b:	e8 10 db ff ff       	call   80100d80 <filealloc>
80103270:	85 c0                	test   %eax,%eax
80103272:	89 03                	mov    %eax,(%ebx)
80103274:	74 22                	je     80103298 <pipealloc+0x48>
80103276:	e8 05 db ff ff       	call   80100d80 <filealloc>
8010327b:	85 c0                	test   %eax,%eax
8010327d:	89 06                	mov    %eax,(%esi)
8010327f:	74 3f                	je     801032c0 <pipealloc+0x70>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
80103281:	e8 4a f2 ff ff       	call   801024d0 <kalloc>
80103286:	85 c0                	test   %eax,%eax
80103288:	89 c7                	mov    %eax,%edi
8010328a:	75 54                	jne    801032e0 <pipealloc+0x90>

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
8010328c:	8b 03                	mov    (%ebx),%eax
8010328e:	85 c0                	test   %eax,%eax
80103290:	75 34                	jne    801032c6 <pipealloc+0x76>
80103292:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    fileclose(*f0);
  if(*f1)
80103298:	8b 06                	mov    (%esi),%eax
8010329a:	85 c0                	test   %eax,%eax
8010329c:	74 0c                	je     801032aa <pipealloc+0x5a>
    fileclose(*f1);
8010329e:	83 ec 0c             	sub    $0xc,%esp
801032a1:	50                   	push   %eax
801032a2:	e8 99 db ff ff       	call   80100e40 <fileclose>
801032a7:	83 c4 10             	add    $0x10,%esp
  return -1;
}
801032aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
801032ad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801032b2:	5b                   	pop    %ebx
801032b3:	5e                   	pop    %esi
801032b4:	5f                   	pop    %edi
801032b5:	5d                   	pop    %ebp
801032b6:	c3                   	ret    
801032b7:	89 f6                	mov    %esi,%esi
801032b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(*f0)
801032c0:	8b 03                	mov    (%ebx),%eax
801032c2:	85 c0                	test   %eax,%eax
801032c4:	74 e4                	je     801032aa <pipealloc+0x5a>
    fileclose(*f0);
801032c6:	83 ec 0c             	sub    $0xc,%esp
801032c9:	50                   	push   %eax
801032ca:	e8 71 db ff ff       	call   80100e40 <fileclose>
  if(*f1)
801032cf:	8b 06                	mov    (%esi),%eax
    fileclose(*f0);
801032d1:	83 c4 10             	add    $0x10,%esp
  if(*f1)
801032d4:	85 c0                	test   %eax,%eax
801032d6:	75 c6                	jne    8010329e <pipealloc+0x4e>
801032d8:	eb d0                	jmp    801032aa <pipealloc+0x5a>
801032da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  initlock(&p->lock, "pipe");
801032e0:	83 ec 08             	sub    $0x8,%esp
  p->readopen = 1;
801032e3:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
801032ea:	00 00 00 
  p->writeopen = 1;
801032ed:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
801032f4:	00 00 00 
  p->nwrite = 0;
801032f7:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
801032fe:	00 00 00 
  p->nread = 0;
80103301:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103308:	00 00 00 
  initlock(&p->lock, "pipe");
8010330b:	68 50 78 10 80       	push   $0x80107850
80103310:	50                   	push   %eax
80103311:	e8 7a 0f 00 00       	call   80104290 <initlock>
  (*f0)->type = FD_PIPE;
80103316:	8b 03                	mov    (%ebx),%eax
  return 0;
80103318:	83 c4 10             	add    $0x10,%esp
  (*f0)->type = FD_PIPE;
8010331b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103321:	8b 03                	mov    (%ebx),%eax
80103323:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
80103327:	8b 03                	mov    (%ebx),%eax
80103329:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
8010332d:	8b 03                	mov    (%ebx),%eax
8010332f:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
80103332:	8b 06                	mov    (%esi),%eax
80103334:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
8010333a:	8b 06                	mov    (%esi),%eax
8010333c:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80103340:	8b 06                	mov    (%esi),%eax
80103342:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
80103346:	8b 06                	mov    (%esi),%eax
80103348:	89 78 0c             	mov    %edi,0xc(%eax)
}
8010334b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
8010334e:	31 c0                	xor    %eax,%eax
}
80103350:	5b                   	pop    %ebx
80103351:	5e                   	pop    %esi
80103352:	5f                   	pop    %edi
80103353:	5d                   	pop    %ebp
80103354:	c3                   	ret    
80103355:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103360 <pipeclose>:

void
pipeclose(struct pipe *p, int writable)
{
80103360:	55                   	push   %ebp
80103361:	89 e5                	mov    %esp,%ebp
80103363:	56                   	push   %esi
80103364:	53                   	push   %ebx
80103365:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103368:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
8010336b:	83 ec 0c             	sub    $0xc,%esp
8010336e:	53                   	push   %ebx
8010336f:	e8 5c 10 00 00       	call   801043d0 <acquire>
  if(writable){
80103374:	83 c4 10             	add    $0x10,%esp
80103377:	85 f6                	test   %esi,%esi
80103379:	74 45                	je     801033c0 <pipeclose+0x60>
    p->writeopen = 0;
    wakeup(&p->nread);
8010337b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103381:	83 ec 0c             	sub    $0xc,%esp
    p->writeopen = 0;
80103384:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010338b:	00 00 00 
    wakeup(&p->nread);
8010338e:	50                   	push   %eax
8010338f:	e8 1c 0c 00 00       	call   80103fb0 <wakeup>
80103394:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103397:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010339d:	85 d2                	test   %edx,%edx
8010339f:	75 0a                	jne    801033ab <pipeclose+0x4b>
801033a1:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
801033a7:	85 c0                	test   %eax,%eax
801033a9:	74 35                	je     801033e0 <pipeclose+0x80>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
801033ab:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801033ae:	8d 65 f8             	lea    -0x8(%ebp),%esp
801033b1:	5b                   	pop    %ebx
801033b2:	5e                   	pop    %esi
801033b3:	5d                   	pop    %ebp
    release(&p->lock);
801033b4:	e9 d7 10 00 00       	jmp    80104490 <release>
801033b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wakeup(&p->nwrite);
801033c0:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
801033c6:	83 ec 0c             	sub    $0xc,%esp
    p->readopen = 0;
801033c9:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
801033d0:	00 00 00 
    wakeup(&p->nwrite);
801033d3:	50                   	push   %eax
801033d4:	e8 d7 0b 00 00       	call   80103fb0 <wakeup>
801033d9:	83 c4 10             	add    $0x10,%esp
801033dc:	eb b9                	jmp    80103397 <pipeclose+0x37>
801033de:	66 90                	xchg   %ax,%ax
    release(&p->lock);
801033e0:	83 ec 0c             	sub    $0xc,%esp
801033e3:	53                   	push   %ebx
801033e4:	e8 a7 10 00 00       	call   80104490 <release>
    kfree((char*)p);
801033e9:	89 5d 08             	mov    %ebx,0x8(%ebp)
801033ec:	83 c4 10             	add    $0x10,%esp
}
801033ef:	8d 65 f8             	lea    -0x8(%ebp),%esp
801033f2:	5b                   	pop    %ebx
801033f3:	5e                   	pop    %esi
801033f4:	5d                   	pop    %ebp
    kfree((char*)p);
801033f5:	e9 26 ef ff ff       	jmp    80102320 <kfree>
801033fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103400 <pipewrite>:

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80103400:	55                   	push   %ebp
80103401:	89 e5                	mov    %esp,%ebp
80103403:	57                   	push   %edi
80103404:	56                   	push   %esi
80103405:	53                   	push   %ebx
80103406:	83 ec 28             	sub    $0x28,%esp
80103409:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  acquire(&p->lock);
8010340c:	53                   	push   %ebx
8010340d:	e8 be 0f 00 00       	call   801043d0 <acquire>
  for(i = 0; i < n; i++){
80103412:	8b 45 10             	mov    0x10(%ebp),%eax
80103415:	83 c4 10             	add    $0x10,%esp
80103418:	85 c0                	test   %eax,%eax
8010341a:	0f 8e c9 00 00 00    	jle    801034e9 <pipewrite+0xe9>
80103420:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103423:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
80103429:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
8010342f:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80103432:	03 4d 10             	add    0x10(%ebp),%ecx
80103435:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103438:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
8010343e:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
80103444:	39 d0                	cmp    %edx,%eax
80103446:	75 71                	jne    801034b9 <pipewrite+0xb9>
      if(p->readopen == 0 || myproc()->killed){
80103448:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
8010344e:	85 c0                	test   %eax,%eax
80103450:	74 4e                	je     801034a0 <pipewrite+0xa0>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80103452:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
80103458:	eb 3a                	jmp    80103494 <pipewrite+0x94>
8010345a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      wakeup(&p->nread);
80103460:	83 ec 0c             	sub    $0xc,%esp
80103463:	57                   	push   %edi
80103464:	e8 47 0b 00 00       	call   80103fb0 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80103469:	5a                   	pop    %edx
8010346a:	59                   	pop    %ecx
8010346b:	53                   	push   %ebx
8010346c:	56                   	push   %esi
8010346d:	e8 7e 09 00 00       	call   80103df0 <sleep>
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103472:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80103478:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
8010347e:	83 c4 10             	add    $0x10,%esp
80103481:	05 00 02 00 00       	add    $0x200,%eax
80103486:	39 c2                	cmp    %eax,%edx
80103488:	75 36                	jne    801034c0 <pipewrite+0xc0>
      if(p->readopen == 0 || myproc()->killed){
8010348a:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
80103490:	85 c0                	test   %eax,%eax
80103492:	74 0c                	je     801034a0 <pipewrite+0xa0>
80103494:	e8 b7 03 00 00       	call   80103850 <myproc>
80103499:	8b 40 24             	mov    0x24(%eax),%eax
8010349c:	85 c0                	test   %eax,%eax
8010349e:	74 c0                	je     80103460 <pipewrite+0x60>
        release(&p->lock);
801034a0:	83 ec 0c             	sub    $0xc,%esp
801034a3:	53                   	push   %ebx
801034a4:	e8 e7 0f 00 00       	call   80104490 <release>
        return -1;
801034a9:	83 c4 10             	add    $0x10,%esp
801034ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
801034b1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801034b4:	5b                   	pop    %ebx
801034b5:	5e                   	pop    %esi
801034b6:	5f                   	pop    %edi
801034b7:	5d                   	pop    %ebp
801034b8:	c3                   	ret    
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801034b9:	89 c2                	mov    %eax,%edx
801034bb:	90                   	nop
801034bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
801034c0:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801034c3:	8d 42 01             	lea    0x1(%edx),%eax
801034c6:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
801034cc:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
801034d2:	83 c6 01             	add    $0x1,%esi
801034d5:	0f b6 4e ff          	movzbl -0x1(%esi),%ecx
  for(i = 0; i < n; i++){
801034d9:	3b 75 e0             	cmp    -0x20(%ebp),%esi
801034dc:	89 75 e4             	mov    %esi,-0x1c(%ebp)
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
801034df:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
  for(i = 0; i < n; i++){
801034e3:	0f 85 4f ff ff ff    	jne    80103438 <pipewrite+0x38>
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
801034e9:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
801034ef:	83 ec 0c             	sub    $0xc,%esp
801034f2:	50                   	push   %eax
801034f3:	e8 b8 0a 00 00       	call   80103fb0 <wakeup>
  release(&p->lock);
801034f8:	89 1c 24             	mov    %ebx,(%esp)
801034fb:	e8 90 0f 00 00       	call   80104490 <release>
  return n;
80103500:	83 c4 10             	add    $0x10,%esp
80103503:	8b 45 10             	mov    0x10(%ebp),%eax
80103506:	eb a9                	jmp    801034b1 <pipewrite+0xb1>
80103508:	90                   	nop
80103509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103510 <piperead>:

int
piperead(struct pipe *p, char *addr, int n)
{
80103510:	55                   	push   %ebp
80103511:	89 e5                	mov    %esp,%ebp
80103513:	57                   	push   %edi
80103514:	56                   	push   %esi
80103515:	53                   	push   %ebx
80103516:	83 ec 18             	sub    $0x18,%esp
80103519:	8b 75 08             	mov    0x8(%ebp),%esi
8010351c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
8010351f:	56                   	push   %esi
80103520:	e8 ab 0e 00 00       	call   801043d0 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103525:	83 c4 10             	add    $0x10,%esp
80103528:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
8010352e:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80103534:	75 6a                	jne    801035a0 <piperead+0x90>
80103536:	8b 9e 40 02 00 00    	mov    0x240(%esi),%ebx
8010353c:	85 db                	test   %ebx,%ebx
8010353e:	0f 84 c4 00 00 00    	je     80103608 <piperead+0xf8>
    if(myproc()->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
80103544:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
8010354a:	eb 2d                	jmp    80103579 <piperead+0x69>
8010354c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103550:	83 ec 08             	sub    $0x8,%esp
80103553:	56                   	push   %esi
80103554:	53                   	push   %ebx
80103555:	e8 96 08 00 00       	call   80103df0 <sleep>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
8010355a:	83 c4 10             	add    $0x10,%esp
8010355d:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
80103563:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80103569:	75 35                	jne    801035a0 <piperead+0x90>
8010356b:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
80103571:	85 d2                	test   %edx,%edx
80103573:	0f 84 8f 00 00 00    	je     80103608 <piperead+0xf8>
    if(myproc()->killed){
80103579:	e8 d2 02 00 00       	call   80103850 <myproc>
8010357e:	8b 48 24             	mov    0x24(%eax),%ecx
80103581:	85 c9                	test   %ecx,%ecx
80103583:	74 cb                	je     80103550 <piperead+0x40>
      release(&p->lock);
80103585:	83 ec 0c             	sub    $0xc,%esp
      return -1;
80103588:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
      release(&p->lock);
8010358d:	56                   	push   %esi
8010358e:	e8 fd 0e 00 00       	call   80104490 <release>
      return -1;
80103593:	83 c4 10             	add    $0x10,%esp
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
80103596:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103599:	89 d8                	mov    %ebx,%eax
8010359b:	5b                   	pop    %ebx
8010359c:	5e                   	pop    %esi
8010359d:	5f                   	pop    %edi
8010359e:	5d                   	pop    %ebp
8010359f:	c3                   	ret    
  for(i = 0; i < n; i++){  //DOC: piperead-copy
801035a0:	8b 45 10             	mov    0x10(%ebp),%eax
801035a3:	85 c0                	test   %eax,%eax
801035a5:	7e 61                	jle    80103608 <piperead+0xf8>
    if(p->nread == p->nwrite)
801035a7:	31 db                	xor    %ebx,%ebx
801035a9:	eb 13                	jmp    801035be <piperead+0xae>
801035ab:	90                   	nop
801035ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801035b0:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
801035b6:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
801035bc:	74 1f                	je     801035dd <piperead+0xcd>
    addr[i] = p->data[p->nread++ % PIPESIZE];
801035be:	8d 41 01             	lea    0x1(%ecx),%eax
801035c1:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
801035c7:	89 86 34 02 00 00    	mov    %eax,0x234(%esi)
801035cd:	0f b6 44 0e 34       	movzbl 0x34(%esi,%ecx,1),%eax
801035d2:	88 04 1f             	mov    %al,(%edi,%ebx,1)
  for(i = 0; i < n; i++){  //DOC: piperead-copy
801035d5:	83 c3 01             	add    $0x1,%ebx
801035d8:	39 5d 10             	cmp    %ebx,0x10(%ebp)
801035db:	75 d3                	jne    801035b0 <piperead+0xa0>
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
801035dd:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
801035e3:	83 ec 0c             	sub    $0xc,%esp
801035e6:	50                   	push   %eax
801035e7:	e8 c4 09 00 00       	call   80103fb0 <wakeup>
  release(&p->lock);
801035ec:	89 34 24             	mov    %esi,(%esp)
801035ef:	e8 9c 0e 00 00       	call   80104490 <release>
  return i;
801035f4:	83 c4 10             	add    $0x10,%esp
}
801035f7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801035fa:	89 d8                	mov    %ebx,%eax
801035fc:	5b                   	pop    %ebx
801035fd:	5e                   	pop    %esi
801035fe:	5f                   	pop    %edi
801035ff:	5d                   	pop    %ebp
80103600:	c3                   	ret    
80103601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103608:	31 db                	xor    %ebx,%ebx
8010360a:	eb d1                	jmp    801035dd <piperead+0xcd>
8010360c:	66 90                	xchg   %ax,%ax
8010360e:	66 90                	xchg   %ax,%ax

80103610 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103610:	55                   	push   %ebp
80103611:	89 e5                	mov    %esp,%ebp
80103613:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103614:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
{
80103619:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);
8010361c:	68 20 2d 11 80       	push   $0x80112d20
80103621:	e8 aa 0d 00 00       	call   801043d0 <acquire>
80103626:	83 c4 10             	add    $0x10,%esp
80103629:	eb 17                	jmp    80103642 <allocproc+0x32>
8010362b:	90                   	nop
8010362c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103630:	81 c3 a0 00 00 00    	add    $0xa0,%ebx
80103636:	81 fb 54 55 11 80    	cmp    $0x80115554,%ebx
8010363c:	0f 83 d6 00 00 00    	jae    80103718 <allocproc+0x108>
    if(p->state == UNUSED)
80103642:	8b 43 0c             	mov    0xc(%ebx),%eax
80103645:	85 c0                	test   %eax,%eax
80103647:	75 e7                	jne    80103630 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
80103649:	a1 04 a0 10 80       	mov    0x8010a004,%eax

  release(&ptable.lock);
8010364e:	83 ec 0c             	sub    $0xc,%esp
  p->state = EMBRYO;
80103651:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;
80103658:	8d 50 01             	lea    0x1(%eax),%edx
8010365b:	89 43 10             	mov    %eax,0x10(%ebx)
  release(&ptable.lock);
8010365e:	68 20 2d 11 80       	push   $0x80112d20
  p->pid = nextpid++;
80103663:	89 15 04 a0 10 80    	mov    %edx,0x8010a004
  release(&ptable.lock);
80103669:	e8 22 0e 00 00       	call   80104490 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
8010366e:	e8 5d ee ff ff       	call   801024d0 <kalloc>
80103673:	83 c4 10             	add    $0x10,%esp
80103676:	85 c0                	test   %eax,%eax
80103678:	89 43 08             	mov    %eax,0x8(%ebx)
8010367b:	0f 84 b0 00 00 00    	je     80103731 <allocproc+0x121>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103681:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
80103687:	83 ec 04             	sub    $0x4,%esp
  sp -= sizeof *p->context;
8010368a:	05 9c 0f 00 00       	add    $0xf9c,%eax
  sp -= sizeof *p->tf;
8010368f:	89 53 18             	mov    %edx,0x18(%ebx)
  *(uint*)sp = (uint)trapret;
80103692:	c7 40 14 df 57 10 80 	movl   $0x801057df,0x14(%eax)
  p->context = (struct context*)sp;
80103699:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
8010369c:	6a 14                	push   $0x14
8010369e:	6a 00                	push   $0x0
801036a0:	50                   	push   %eax
801036a1:	e8 3a 0e 00 00       	call   801044e0 <memset>
  p->context->eip = (uint)forkret;
801036a6:	8b 43 1c             	mov    0x1c(%ebx),%eax
  
  p->eax = 0;
  p->edx = 0;
  p->ecx = 0;

  return p;
801036a9:	83 c4 10             	add    $0x10,%esp
  p->context->eip = (uint)forkret;
801036ac:	c7 40 10 40 37 10 80 	movl   $0x80103740,0x10(%eax)
  p->alarmticks = 0;
801036b3:	c7 43 7c 00 00 00 00 	movl   $0x0,0x7c(%ebx)
  p->ticksby = 0;
801036ba:	c7 83 80 00 00 00 00 	movl   $0x0,0x80(%ebx)
801036c1:	00 00 00 
  p->alarmhandler = 0;
801036c4:	c7 83 84 00 00 00 00 	movl   $0x0,0x84(%ebx)
801036cb:	00 00 00 
  p->alarmstate = 0;
801036ce:	c7 83 90 00 00 00 00 	movl   $0x0,0x90(%ebx)
801036d5:	00 00 00 
  p->resume = 0;
801036d8:	c7 83 88 00 00 00 00 	movl   $0x0,0x88(%ebx)
801036df:	00 00 00 
  p->validcheck = 0;
801036e2:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
801036e9:	00 00 00 
  p->eax = 0;
801036ec:	c7 83 94 00 00 00 00 	movl   $0x0,0x94(%ebx)
801036f3:	00 00 00 
  p->edx = 0;
801036f6:	c7 83 98 00 00 00 00 	movl   $0x0,0x98(%ebx)
801036fd:	00 00 00 
  p->ecx = 0;
80103700:	c7 83 9c 00 00 00 00 	movl   $0x0,0x9c(%ebx)
80103707:	00 00 00 
}
8010370a:	89 d8                	mov    %ebx,%eax
8010370c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010370f:	c9                   	leave  
80103710:	c3                   	ret    
80103711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  release(&ptable.lock);
80103718:	83 ec 0c             	sub    $0xc,%esp
  return 0;
8010371b:	31 db                	xor    %ebx,%ebx
  release(&ptable.lock);
8010371d:	68 20 2d 11 80       	push   $0x80112d20
80103722:	e8 69 0d 00 00       	call   80104490 <release>
}
80103727:	89 d8                	mov    %ebx,%eax
  return 0;
80103729:	83 c4 10             	add    $0x10,%esp
}
8010372c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010372f:	c9                   	leave  
80103730:	c3                   	ret    
    p->state = UNUSED;
80103731:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
80103738:	31 db                	xor    %ebx,%ebx
8010373a:	eb ce                	jmp    8010370a <allocproc+0xfa>
8010373c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103740 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103740:	55                   	push   %ebp
80103741:	89 e5                	mov    %esp,%ebp
80103743:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103746:	68 20 2d 11 80       	push   $0x80112d20
8010374b:	e8 40 0d 00 00       	call   80104490 <release>

  if (first) {
80103750:	a1 00 a0 10 80       	mov    0x8010a000,%eax
80103755:	83 c4 10             	add    $0x10,%esp
80103758:	85 c0                	test   %eax,%eax
8010375a:	75 04                	jne    80103760 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010375c:	c9                   	leave  
8010375d:	c3                   	ret    
8010375e:	66 90                	xchg   %ax,%ax
    iinit(ROOTDEV);
80103760:	83 ec 0c             	sub    $0xc,%esp
    first = 0;
80103763:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
8010376a:	00 00 00 
    iinit(ROOTDEV);
8010376d:	6a 01                	push   $0x1
8010376f:	e8 1c dd ff ff       	call   80101490 <iinit>
    initlog(ROOTDEV);
80103774:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010377b:	e8 90 f3 ff ff       	call   80102b10 <initlog>
80103780:	83 c4 10             	add    $0x10,%esp
}
80103783:	c9                   	leave  
80103784:	c3                   	ret    
80103785:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103790 <pinit>:
{
80103790:	55                   	push   %ebp
80103791:	89 e5                	mov    %esp,%ebp
80103793:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
80103796:	68 55 78 10 80       	push   $0x80107855
8010379b:	68 20 2d 11 80       	push   $0x80112d20
801037a0:	e8 eb 0a 00 00       	call   80104290 <initlock>
}
801037a5:	83 c4 10             	add    $0x10,%esp
801037a8:	c9                   	leave  
801037a9:	c3                   	ret    
801037aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801037b0 <mycpu>:
{
801037b0:	55                   	push   %ebp
801037b1:	89 e5                	mov    %esp,%ebp
801037b3:	56                   	push   %esi
801037b4:	53                   	push   %ebx
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801037b5:	9c                   	pushf  
801037b6:	58                   	pop    %eax
  if(readeflags()&FL_IF)
801037b7:	f6 c4 02             	test   $0x2,%ah
801037ba:	75 5e                	jne    8010381a <mycpu+0x6a>
  apicid = lapicid();
801037bc:	e8 7f ef ff ff       	call   80102740 <lapicid>
  for (i = 0; i < ncpu; ++i) {
801037c1:	8b 35 00 2d 11 80    	mov    0x80112d00,%esi
801037c7:	85 f6                	test   %esi,%esi
801037c9:	7e 42                	jle    8010380d <mycpu+0x5d>
    if (cpus[i].apicid == apicid)
801037cb:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx
801037d2:	39 d0                	cmp    %edx,%eax
801037d4:	74 30                	je     80103806 <mycpu+0x56>
801037d6:	b9 30 28 11 80       	mov    $0x80112830,%ecx
  for (i = 0; i < ncpu; ++i) {
801037db:	31 d2                	xor    %edx,%edx
801037dd:	8d 76 00             	lea    0x0(%esi),%esi
801037e0:	83 c2 01             	add    $0x1,%edx
801037e3:	39 f2                	cmp    %esi,%edx
801037e5:	74 26                	je     8010380d <mycpu+0x5d>
    if (cpus[i].apicid == apicid)
801037e7:	0f b6 19             	movzbl (%ecx),%ebx
801037ea:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
801037f0:	39 c3                	cmp    %eax,%ebx
801037f2:	75 ec                	jne    801037e0 <mycpu+0x30>
801037f4:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
801037fa:	05 80 27 11 80       	add    $0x80112780,%eax
}
801037ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103802:	5b                   	pop    %ebx
80103803:	5e                   	pop    %esi
80103804:	5d                   	pop    %ebp
80103805:	c3                   	ret    
    if (cpus[i].apicid == apicid)
80103806:	b8 80 27 11 80       	mov    $0x80112780,%eax
      return &cpus[i];
8010380b:	eb f2                	jmp    801037ff <mycpu+0x4f>
  panic("unknown apicid\n");
8010380d:	83 ec 0c             	sub    $0xc,%esp
80103810:	68 5c 78 10 80       	push   $0x8010785c
80103815:	e8 76 cb ff ff       	call   80100390 <panic>
    panic("mycpu called with interrupts enabled\n");
8010381a:	83 ec 0c             	sub    $0xc,%esp
8010381d:	68 38 79 10 80       	push   $0x80107938
80103822:	e8 69 cb ff ff       	call   80100390 <panic>
80103827:	89 f6                	mov    %esi,%esi
80103829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103830 <cpuid>:
cpuid() {
80103830:	55                   	push   %ebp
80103831:	89 e5                	mov    %esp,%ebp
80103833:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
80103836:	e8 75 ff ff ff       	call   801037b0 <mycpu>
8010383b:	2d 80 27 11 80       	sub    $0x80112780,%eax
}
80103840:	c9                   	leave  
  return mycpu()-cpus;
80103841:	c1 f8 04             	sar    $0x4,%eax
80103844:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
8010384a:	c3                   	ret    
8010384b:	90                   	nop
8010384c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103850 <myproc>:
myproc(void) {
80103850:	55                   	push   %ebp
80103851:	89 e5                	mov    %esp,%ebp
80103853:	53                   	push   %ebx
80103854:	83 ec 04             	sub    $0x4,%esp
  pushcli();
80103857:	e8 a4 0a 00 00       	call   80104300 <pushcli>
  c = mycpu();
8010385c:	e8 4f ff ff ff       	call   801037b0 <mycpu>
  p = c->proc;
80103861:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103867:	e8 d4 0a 00 00       	call   80104340 <popcli>
}
8010386c:	83 c4 04             	add    $0x4,%esp
8010386f:	89 d8                	mov    %ebx,%eax
80103871:	5b                   	pop    %ebx
80103872:	5d                   	pop    %ebp
80103873:	c3                   	ret    
80103874:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010387a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103880 <userinit>:
{
80103880:	55                   	push   %ebp
80103881:	89 e5                	mov    %esp,%ebp
80103883:	53                   	push   %ebx
80103884:	83 ec 04             	sub    $0x4,%esp
  p = allocproc();
80103887:	e8 84 fd ff ff       	call   80103610 <allocproc>
8010388c:	89 c3                	mov    %eax,%ebx
  initproc = p;
8010388e:	a3 b8 a5 10 80       	mov    %eax,0x8010a5b8
  if((p->pgdir = setupkvm()) == 0)
80103893:	e8 a8 37 00 00       	call   80107040 <setupkvm>
80103898:	85 c0                	test   %eax,%eax
8010389a:	89 43 04             	mov    %eax,0x4(%ebx)
8010389d:	0f 84 bd 00 00 00    	je     80103960 <userinit+0xe0>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801038a3:	83 ec 04             	sub    $0x4,%esp
801038a6:	68 2c 00 00 00       	push   $0x2c
801038ab:	68 60 a4 10 80       	push   $0x8010a460
801038b0:	50                   	push   %eax
801038b1:	e8 7a 34 00 00       	call   80106d30 <inituvm>
  memset(p->tf, 0, sizeof(*p->tf));
801038b6:	83 c4 0c             	add    $0xc,%esp
  p->sz = PGSIZE;
801038b9:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
801038bf:	6a 4c                	push   $0x4c
801038c1:	6a 00                	push   $0x0
801038c3:	ff 73 18             	pushl  0x18(%ebx)
801038c6:	e8 15 0c 00 00       	call   801044e0 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801038cb:	8b 43 18             	mov    0x18(%ebx),%eax
801038ce:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801038d3:	b9 23 00 00 00       	mov    $0x23,%ecx
  safestrcpy(p->name, "initcode", sizeof(p->name));
801038d8:	83 c4 0c             	add    $0xc,%esp
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801038db:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801038df:	8b 43 18             	mov    0x18(%ebx),%eax
801038e2:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
801038e6:	8b 43 18             	mov    0x18(%ebx),%eax
801038e9:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801038ed:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
801038f1:	8b 43 18             	mov    0x18(%ebx),%eax
801038f4:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801038f8:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
801038fc:	8b 43 18             	mov    0x18(%ebx),%eax
801038ff:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103906:	8b 43 18             	mov    0x18(%ebx),%eax
80103909:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103910:	8b 43 18             	mov    0x18(%ebx),%eax
80103913:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  safestrcpy(p->name, "initcode", sizeof(p->name));
8010391a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010391d:	6a 10                	push   $0x10
8010391f:	68 85 78 10 80       	push   $0x80107885
80103924:	50                   	push   %eax
80103925:	e8 96 0d 00 00       	call   801046c0 <safestrcpy>
  p->cwd = namei("/");
8010392a:	c7 04 24 8e 78 10 80 	movl   $0x8010788e,(%esp)
80103931:	e8 ba e5 ff ff       	call   80101ef0 <namei>
80103936:	89 43 68             	mov    %eax,0x68(%ebx)
  acquire(&ptable.lock);
80103939:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103940:	e8 8b 0a 00 00       	call   801043d0 <acquire>
  p->state = RUNNABLE;
80103945:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
8010394c:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103953:	e8 38 0b 00 00       	call   80104490 <release>
}
80103958:	83 c4 10             	add    $0x10,%esp
8010395b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010395e:	c9                   	leave  
8010395f:	c3                   	ret    
    panic("userinit: out of memory?");
80103960:	83 ec 0c             	sub    $0xc,%esp
80103963:	68 6c 78 10 80       	push   $0x8010786c
80103968:	e8 23 ca ff ff       	call   80100390 <panic>
8010396d:	8d 76 00             	lea    0x0(%esi),%esi

80103970 <growproc>:
{
80103970:	55                   	push   %ebp
80103971:	89 e5                	mov    %esp,%ebp
80103973:	56                   	push   %esi
80103974:	53                   	push   %ebx
80103975:	8b 75 08             	mov    0x8(%ebp),%esi
  pushcli();
80103978:	e8 83 09 00 00       	call   80104300 <pushcli>
  c = mycpu();
8010397d:	e8 2e fe ff ff       	call   801037b0 <mycpu>
  p = c->proc;
80103982:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103988:	e8 b3 09 00 00       	call   80104340 <popcli>
  if(n > 0){
8010398d:	83 fe 00             	cmp    $0x0,%esi
  sz = curproc->sz;
80103990:	8b 03                	mov    (%ebx),%eax
  if(n > 0){
80103992:	7f 1c                	jg     801039b0 <growproc+0x40>
  } else if(n < 0){
80103994:	75 3a                	jne    801039d0 <growproc+0x60>
  switchuvm(curproc);
80103996:	83 ec 0c             	sub    $0xc,%esp
  curproc->sz = sz;
80103999:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
8010399b:	53                   	push   %ebx
8010399c:	e8 7f 32 00 00       	call   80106c20 <switchuvm>
  return 0;
801039a1:	83 c4 10             	add    $0x10,%esp
801039a4:	31 c0                	xor    %eax,%eax
}
801039a6:	8d 65 f8             	lea    -0x8(%ebp),%esp
801039a9:	5b                   	pop    %ebx
801039aa:	5e                   	pop    %esi
801039ab:	5d                   	pop    %ebp
801039ac:	c3                   	ret    
801039ad:	8d 76 00             	lea    0x0(%esi),%esi
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
801039b0:	83 ec 04             	sub    $0x4,%esp
801039b3:	01 c6                	add    %eax,%esi
801039b5:	56                   	push   %esi
801039b6:	50                   	push   %eax
801039b7:	ff 73 04             	pushl  0x4(%ebx)
801039ba:	e8 b1 34 00 00       	call   80106e70 <allocuvm>
801039bf:	83 c4 10             	add    $0x10,%esp
801039c2:	85 c0                	test   %eax,%eax
801039c4:	75 d0                	jne    80103996 <growproc+0x26>
      return -1;
801039c6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801039cb:	eb d9                	jmp    801039a6 <growproc+0x36>
801039cd:	8d 76 00             	lea    0x0(%esi),%esi
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
801039d0:	83 ec 04             	sub    $0x4,%esp
801039d3:	01 c6                	add    %eax,%esi
801039d5:	56                   	push   %esi
801039d6:	50                   	push   %eax
801039d7:	ff 73 04             	pushl  0x4(%ebx)
801039da:	e8 b1 35 00 00       	call   80106f90 <deallocuvm>
801039df:	83 c4 10             	add    $0x10,%esp
801039e2:	85 c0                	test   %eax,%eax
801039e4:	75 b0                	jne    80103996 <growproc+0x26>
801039e6:	eb de                	jmp    801039c6 <growproc+0x56>
801039e8:	90                   	nop
801039e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801039f0 <fork>:
{
801039f0:	55                   	push   %ebp
801039f1:	89 e5                	mov    %esp,%ebp
801039f3:	57                   	push   %edi
801039f4:	56                   	push   %esi
801039f5:	53                   	push   %ebx
801039f6:	83 ec 1c             	sub    $0x1c,%esp
  pushcli();
801039f9:	e8 02 09 00 00       	call   80104300 <pushcli>
  c = mycpu();
801039fe:	e8 ad fd ff ff       	call   801037b0 <mycpu>
  p = c->proc;
80103a03:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103a09:	e8 32 09 00 00       	call   80104340 <popcli>
  if((np = allocproc()) == 0){
80103a0e:	e8 fd fb ff ff       	call   80103610 <allocproc>
80103a13:	85 c0                	test   %eax,%eax
80103a15:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103a18:	0f 84 b7 00 00 00    	je     80103ad5 <fork+0xe5>
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103a1e:	83 ec 08             	sub    $0x8,%esp
80103a21:	ff 33                	pushl  (%ebx)
80103a23:	ff 73 04             	pushl  0x4(%ebx)
80103a26:	89 c7                	mov    %eax,%edi
80103a28:	e8 e3 36 00 00       	call   80107110 <copyuvm>
80103a2d:	83 c4 10             	add    $0x10,%esp
80103a30:	85 c0                	test   %eax,%eax
80103a32:	89 47 04             	mov    %eax,0x4(%edi)
80103a35:	0f 84 a1 00 00 00    	je     80103adc <fork+0xec>
  np->sz = curproc->sz;
80103a3b:	8b 03                	mov    (%ebx),%eax
80103a3d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103a40:	89 01                	mov    %eax,(%ecx)
  np->parent = curproc;
80103a42:	89 59 14             	mov    %ebx,0x14(%ecx)
80103a45:	89 c8                	mov    %ecx,%eax
  *np->tf = *curproc->tf;
80103a47:	8b 79 18             	mov    0x18(%ecx),%edi
80103a4a:	8b 73 18             	mov    0x18(%ebx),%esi
80103a4d:	b9 13 00 00 00       	mov    $0x13,%ecx
80103a52:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  for(i = 0; i < NOFILE; i++)
80103a54:	31 f6                	xor    %esi,%esi
  np->tf->eax = 0;
80103a56:	8b 40 18             	mov    0x18(%eax),%eax
80103a59:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
    if(curproc->ofile[i])
80103a60:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103a64:	85 c0                	test   %eax,%eax
80103a66:	74 13                	je     80103a7b <fork+0x8b>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103a68:	83 ec 0c             	sub    $0xc,%esp
80103a6b:	50                   	push   %eax
80103a6c:	e8 7f d3 ff ff       	call   80100df0 <filedup>
80103a71:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103a74:	83 c4 10             	add    $0x10,%esp
80103a77:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
  for(i = 0; i < NOFILE; i++)
80103a7b:	83 c6 01             	add    $0x1,%esi
80103a7e:	83 fe 10             	cmp    $0x10,%esi
80103a81:	75 dd                	jne    80103a60 <fork+0x70>
  np->cwd = idup(curproc->cwd);
80103a83:	83 ec 0c             	sub    $0xc,%esp
80103a86:	ff 73 68             	pushl  0x68(%ebx)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103a89:	83 c3 6c             	add    $0x6c,%ebx
  np->cwd = idup(curproc->cwd);
80103a8c:	e8 cf db ff ff       	call   80101660 <idup>
80103a91:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103a94:	83 c4 0c             	add    $0xc,%esp
  np->cwd = idup(curproc->cwd);
80103a97:	89 47 68             	mov    %eax,0x68(%edi)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103a9a:	8d 47 6c             	lea    0x6c(%edi),%eax
80103a9d:	6a 10                	push   $0x10
80103a9f:	53                   	push   %ebx
80103aa0:	50                   	push   %eax
80103aa1:	e8 1a 0c 00 00       	call   801046c0 <safestrcpy>
  pid = np->pid;
80103aa6:	8b 5f 10             	mov    0x10(%edi),%ebx
  acquire(&ptable.lock);
80103aa9:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103ab0:	e8 1b 09 00 00       	call   801043d0 <acquire>
  np->state = RUNNABLE;
80103ab5:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
  release(&ptable.lock);
80103abc:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103ac3:	e8 c8 09 00 00       	call   80104490 <release>
  return pid;
80103ac8:	83 c4 10             	add    $0x10,%esp
}
80103acb:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103ace:	89 d8                	mov    %ebx,%eax
80103ad0:	5b                   	pop    %ebx
80103ad1:	5e                   	pop    %esi
80103ad2:	5f                   	pop    %edi
80103ad3:	5d                   	pop    %ebp
80103ad4:	c3                   	ret    
    return -1;
80103ad5:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103ada:	eb ef                	jmp    80103acb <fork+0xdb>
    kfree(np->kstack);
80103adc:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103adf:	83 ec 0c             	sub    $0xc,%esp
80103ae2:	ff 73 08             	pushl  0x8(%ebx)
80103ae5:	e8 36 e8 ff ff       	call   80102320 <kfree>
    np->kstack = 0;
80103aea:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103af1:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103af8:	83 c4 10             	add    $0x10,%esp
80103afb:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103b00:	eb c9                	jmp    80103acb <fork+0xdb>
80103b02:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103b10 <scheduler>:
{
80103b10:	55                   	push   %ebp
80103b11:	89 e5                	mov    %esp,%ebp
80103b13:	57                   	push   %edi
80103b14:	56                   	push   %esi
80103b15:	53                   	push   %ebx
80103b16:	83 ec 0c             	sub    $0xc,%esp
  struct cpu *c = mycpu();
80103b19:	e8 92 fc ff ff       	call   801037b0 <mycpu>
80103b1e:	8d 78 04             	lea    0x4(%eax),%edi
80103b21:	89 c6                	mov    %eax,%esi
  c->proc = 0;
80103b23:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103b2a:	00 00 00 
80103b2d:	8d 76 00             	lea    0x0(%esi),%esi
  asm volatile("sti");
80103b30:	fb                   	sti    
    acquire(&ptable.lock);
80103b31:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103b34:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
    acquire(&ptable.lock);
80103b39:	68 20 2d 11 80       	push   $0x80112d20
80103b3e:	e8 8d 08 00 00       	call   801043d0 <acquire>
80103b43:	83 c4 10             	add    $0x10,%esp
80103b46:	8d 76 00             	lea    0x0(%esi),%esi
80103b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      if(p->state != RUNNABLE)
80103b50:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103b54:	75 33                	jne    80103b89 <scheduler+0x79>
      switchuvm(p);
80103b56:	83 ec 0c             	sub    $0xc,%esp
      c->proc = p;
80103b59:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
      switchuvm(p);
80103b5f:	53                   	push   %ebx
80103b60:	e8 bb 30 00 00       	call   80106c20 <switchuvm>
      swtch(&(c->scheduler), p->context);
80103b65:	58                   	pop    %eax
80103b66:	5a                   	pop    %edx
80103b67:	ff 73 1c             	pushl  0x1c(%ebx)
80103b6a:	57                   	push   %edi
      p->state = RUNNING;
80103b6b:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
      swtch(&(c->scheduler), p->context);
80103b72:	e8 a4 0b 00 00       	call   8010471b <swtch>
      switchkvm();
80103b77:	e8 84 30 00 00       	call   80106c00 <switchkvm>
      c->proc = 0;
80103b7c:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103b83:	00 00 00 
80103b86:	83 c4 10             	add    $0x10,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103b89:	81 c3 a0 00 00 00    	add    $0xa0,%ebx
80103b8f:	81 fb 54 55 11 80    	cmp    $0x80115554,%ebx
80103b95:	72 b9                	jb     80103b50 <scheduler+0x40>
    release(&ptable.lock);
80103b97:	83 ec 0c             	sub    $0xc,%esp
80103b9a:	68 20 2d 11 80       	push   $0x80112d20
80103b9f:	e8 ec 08 00 00       	call   80104490 <release>
    sti();
80103ba4:	83 c4 10             	add    $0x10,%esp
80103ba7:	eb 87                	jmp    80103b30 <scheduler+0x20>
80103ba9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103bb0 <sched>:
{
80103bb0:	55                   	push   %ebp
80103bb1:	89 e5                	mov    %esp,%ebp
80103bb3:	56                   	push   %esi
80103bb4:	53                   	push   %ebx
  pushcli();
80103bb5:	e8 46 07 00 00       	call   80104300 <pushcli>
  c = mycpu();
80103bba:	e8 f1 fb ff ff       	call   801037b0 <mycpu>
  p = c->proc;
80103bbf:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103bc5:	e8 76 07 00 00       	call   80104340 <popcli>
  if(!holding(&ptable.lock))
80103bca:	83 ec 0c             	sub    $0xc,%esp
80103bcd:	68 20 2d 11 80       	push   $0x80112d20
80103bd2:	e8 c9 07 00 00       	call   801043a0 <holding>
80103bd7:	83 c4 10             	add    $0x10,%esp
80103bda:	85 c0                	test   %eax,%eax
80103bdc:	74 4f                	je     80103c2d <sched+0x7d>
  if(mycpu()->ncli != 1)
80103bde:	e8 cd fb ff ff       	call   801037b0 <mycpu>
80103be3:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103bea:	75 68                	jne    80103c54 <sched+0xa4>
  if(p->state == RUNNING)
80103bec:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103bf0:	74 55                	je     80103c47 <sched+0x97>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103bf2:	9c                   	pushf  
80103bf3:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103bf4:	f6 c4 02             	test   $0x2,%ah
80103bf7:	75 41                	jne    80103c3a <sched+0x8a>
  intena = mycpu()->intena;
80103bf9:	e8 b2 fb ff ff       	call   801037b0 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103bfe:	83 c3 1c             	add    $0x1c,%ebx
  intena = mycpu()->intena;
80103c01:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103c07:	e8 a4 fb ff ff       	call   801037b0 <mycpu>
80103c0c:	83 ec 08             	sub    $0x8,%esp
80103c0f:	ff 70 04             	pushl  0x4(%eax)
80103c12:	53                   	push   %ebx
80103c13:	e8 03 0b 00 00       	call   8010471b <swtch>
  mycpu()->intena = intena;
80103c18:	e8 93 fb ff ff       	call   801037b0 <mycpu>
}
80103c1d:	83 c4 10             	add    $0x10,%esp
  mycpu()->intena = intena;
80103c20:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103c26:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103c29:	5b                   	pop    %ebx
80103c2a:	5e                   	pop    %esi
80103c2b:	5d                   	pop    %ebp
80103c2c:	c3                   	ret    
    panic("sched ptable.lock");
80103c2d:	83 ec 0c             	sub    $0xc,%esp
80103c30:	68 90 78 10 80       	push   $0x80107890
80103c35:	e8 56 c7 ff ff       	call   80100390 <panic>
    panic("sched interruptible");
80103c3a:	83 ec 0c             	sub    $0xc,%esp
80103c3d:	68 bc 78 10 80       	push   $0x801078bc
80103c42:	e8 49 c7 ff ff       	call   80100390 <panic>
    panic("sched running");
80103c47:	83 ec 0c             	sub    $0xc,%esp
80103c4a:	68 ae 78 10 80       	push   $0x801078ae
80103c4f:	e8 3c c7 ff ff       	call   80100390 <panic>
    panic("sched locks");
80103c54:	83 ec 0c             	sub    $0xc,%esp
80103c57:	68 a2 78 10 80       	push   $0x801078a2
80103c5c:	e8 2f c7 ff ff       	call   80100390 <panic>
80103c61:	eb 0d                	jmp    80103c70 <exit>
80103c63:	90                   	nop
80103c64:	90                   	nop
80103c65:	90                   	nop
80103c66:	90                   	nop
80103c67:	90                   	nop
80103c68:	90                   	nop
80103c69:	90                   	nop
80103c6a:	90                   	nop
80103c6b:	90                   	nop
80103c6c:	90                   	nop
80103c6d:	90                   	nop
80103c6e:	90                   	nop
80103c6f:	90                   	nop

80103c70 <exit>:
{
80103c70:	55                   	push   %ebp
80103c71:	89 e5                	mov    %esp,%ebp
80103c73:	57                   	push   %edi
80103c74:	56                   	push   %esi
80103c75:	53                   	push   %ebx
80103c76:	83 ec 0c             	sub    $0xc,%esp
  pushcli();
80103c79:	e8 82 06 00 00       	call   80104300 <pushcli>
  c = mycpu();
80103c7e:	e8 2d fb ff ff       	call   801037b0 <mycpu>
  p = c->proc;
80103c83:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103c89:	e8 b2 06 00 00       	call   80104340 <popcli>
  if(curproc == initproc)
80103c8e:	39 35 b8 a5 10 80    	cmp    %esi,0x8010a5b8
80103c94:	8d 5e 28             	lea    0x28(%esi),%ebx
80103c97:	8d 7e 68             	lea    0x68(%esi),%edi
80103c9a:	0f 84 f1 00 00 00    	je     80103d91 <exit+0x121>
    if(curproc->ofile[fd]){
80103ca0:	8b 03                	mov    (%ebx),%eax
80103ca2:	85 c0                	test   %eax,%eax
80103ca4:	74 12                	je     80103cb8 <exit+0x48>
      fileclose(curproc->ofile[fd]);
80103ca6:	83 ec 0c             	sub    $0xc,%esp
80103ca9:	50                   	push   %eax
80103caa:	e8 91 d1 ff ff       	call   80100e40 <fileclose>
      curproc->ofile[fd] = 0;
80103caf:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103cb5:	83 c4 10             	add    $0x10,%esp
80103cb8:	83 c3 04             	add    $0x4,%ebx
  for(fd = 0; fd < NOFILE; fd++){
80103cbb:	39 fb                	cmp    %edi,%ebx
80103cbd:	75 e1                	jne    80103ca0 <exit+0x30>
  begin_op();
80103cbf:	e8 ec ee ff ff       	call   80102bb0 <begin_op>
  iput(curproc->cwd);
80103cc4:	83 ec 0c             	sub    $0xc,%esp
80103cc7:	ff 76 68             	pushl  0x68(%esi)
80103cca:	e8 f1 da ff ff       	call   801017c0 <iput>
  end_op();
80103ccf:	e8 4c ef ff ff       	call   80102c20 <end_op>
  curproc->cwd = 0;
80103cd4:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
  acquire(&ptable.lock);
80103cdb:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103ce2:	e8 e9 06 00 00       	call   801043d0 <acquire>
  wakeup1(curproc->parent);
80103ce7:	8b 56 14             	mov    0x14(%esi),%edx
80103cea:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103ced:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103cf2:	eb 10                	jmp    80103d04 <exit+0x94>
80103cf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103cf8:	05 a0 00 00 00       	add    $0xa0,%eax
80103cfd:	3d 54 55 11 80       	cmp    $0x80115554,%eax
80103d02:	73 1e                	jae    80103d22 <exit+0xb2>
    if(p->state == SLEEPING && p->chan == chan)
80103d04:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103d08:	75 ee                	jne    80103cf8 <exit+0x88>
80103d0a:	3b 50 20             	cmp    0x20(%eax),%edx
80103d0d:	75 e9                	jne    80103cf8 <exit+0x88>
      p->state = RUNNABLE;
80103d0f:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103d16:	05 a0 00 00 00       	add    $0xa0,%eax
80103d1b:	3d 54 55 11 80       	cmp    $0x80115554,%eax
80103d20:	72 e2                	jb     80103d04 <exit+0x94>
      p->parent = initproc;
80103d22:	8b 0d b8 a5 10 80    	mov    0x8010a5b8,%ecx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103d28:	ba 54 2d 11 80       	mov    $0x80112d54,%edx
80103d2d:	eb 0f                	jmp    80103d3e <exit+0xce>
80103d2f:	90                   	nop
80103d30:	81 c2 a0 00 00 00    	add    $0xa0,%edx
80103d36:	81 fa 54 55 11 80    	cmp    $0x80115554,%edx
80103d3c:	73 3a                	jae    80103d78 <exit+0x108>
    if(p->parent == curproc){
80103d3e:	39 72 14             	cmp    %esi,0x14(%edx)
80103d41:	75 ed                	jne    80103d30 <exit+0xc0>
      if(p->state == ZOMBIE)
80103d43:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
      p->parent = initproc;
80103d47:	89 4a 14             	mov    %ecx,0x14(%edx)
      if(p->state == ZOMBIE)
80103d4a:	75 e4                	jne    80103d30 <exit+0xc0>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103d4c:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103d51:	eb 11                	jmp    80103d64 <exit+0xf4>
80103d53:	90                   	nop
80103d54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103d58:	05 a0 00 00 00       	add    $0xa0,%eax
80103d5d:	3d 54 55 11 80       	cmp    $0x80115554,%eax
80103d62:	73 cc                	jae    80103d30 <exit+0xc0>
    if(p->state == SLEEPING && p->chan == chan)
80103d64:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103d68:	75 ee                	jne    80103d58 <exit+0xe8>
80103d6a:	3b 48 20             	cmp    0x20(%eax),%ecx
80103d6d:	75 e9                	jne    80103d58 <exit+0xe8>
      p->state = RUNNABLE;
80103d6f:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103d76:	eb e0                	jmp    80103d58 <exit+0xe8>
  curproc->state = ZOMBIE;
80103d78:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
80103d7f:	e8 2c fe ff ff       	call   80103bb0 <sched>
  panic("zombie exit");
80103d84:	83 ec 0c             	sub    $0xc,%esp
80103d87:	68 dd 78 10 80       	push   $0x801078dd
80103d8c:	e8 ff c5 ff ff       	call   80100390 <panic>
    panic("init exiting");
80103d91:	83 ec 0c             	sub    $0xc,%esp
80103d94:	68 d0 78 10 80       	push   $0x801078d0
80103d99:	e8 f2 c5 ff ff       	call   80100390 <panic>
80103d9e:	66 90                	xchg   %ax,%ax

80103da0 <yield>:
{
80103da0:	55                   	push   %ebp
80103da1:	89 e5                	mov    %esp,%ebp
80103da3:	53                   	push   %ebx
80103da4:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103da7:	68 20 2d 11 80       	push   $0x80112d20
80103dac:	e8 1f 06 00 00       	call   801043d0 <acquire>
  pushcli();
80103db1:	e8 4a 05 00 00       	call   80104300 <pushcli>
  c = mycpu();
80103db6:	e8 f5 f9 ff ff       	call   801037b0 <mycpu>
  p = c->proc;
80103dbb:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103dc1:	e8 7a 05 00 00       	call   80104340 <popcli>
  myproc()->state = RUNNABLE;
80103dc6:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80103dcd:	e8 de fd ff ff       	call   80103bb0 <sched>
  release(&ptable.lock);
80103dd2:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103dd9:	e8 b2 06 00 00       	call   80104490 <release>
}
80103dde:	83 c4 10             	add    $0x10,%esp
80103de1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103de4:	c9                   	leave  
80103de5:	c3                   	ret    
80103de6:	8d 76 00             	lea    0x0(%esi),%esi
80103de9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103df0 <sleep>:
{
80103df0:	55                   	push   %ebp
80103df1:	89 e5                	mov    %esp,%ebp
80103df3:	57                   	push   %edi
80103df4:	56                   	push   %esi
80103df5:	53                   	push   %ebx
80103df6:	83 ec 0c             	sub    $0xc,%esp
80103df9:	8b 7d 08             	mov    0x8(%ebp),%edi
80103dfc:	8b 75 0c             	mov    0xc(%ebp),%esi
  pushcli();
80103dff:	e8 fc 04 00 00       	call   80104300 <pushcli>
  c = mycpu();
80103e04:	e8 a7 f9 ff ff       	call   801037b0 <mycpu>
  p = c->proc;
80103e09:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103e0f:	e8 2c 05 00 00       	call   80104340 <popcli>
  if(p == 0)
80103e14:	85 db                	test   %ebx,%ebx
80103e16:	0f 84 87 00 00 00    	je     80103ea3 <sleep+0xb3>
  if(lk == 0)
80103e1c:	85 f6                	test   %esi,%esi
80103e1e:	74 76                	je     80103e96 <sleep+0xa6>
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103e20:	81 fe 20 2d 11 80    	cmp    $0x80112d20,%esi
80103e26:	74 50                	je     80103e78 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103e28:	83 ec 0c             	sub    $0xc,%esp
80103e2b:	68 20 2d 11 80       	push   $0x80112d20
80103e30:	e8 9b 05 00 00       	call   801043d0 <acquire>
    release(lk);
80103e35:	89 34 24             	mov    %esi,(%esp)
80103e38:	e8 53 06 00 00       	call   80104490 <release>
  p->chan = chan;
80103e3d:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103e40:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
80103e47:	e8 64 fd ff ff       	call   80103bb0 <sched>
  p->chan = 0;
80103e4c:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
    release(&ptable.lock);
80103e53:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103e5a:	e8 31 06 00 00       	call   80104490 <release>
    acquire(lk);
80103e5f:	89 75 08             	mov    %esi,0x8(%ebp)
80103e62:	83 c4 10             	add    $0x10,%esp
}
80103e65:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103e68:	5b                   	pop    %ebx
80103e69:	5e                   	pop    %esi
80103e6a:	5f                   	pop    %edi
80103e6b:	5d                   	pop    %ebp
    acquire(lk);
80103e6c:	e9 5f 05 00 00       	jmp    801043d0 <acquire>
80103e71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  p->chan = chan;
80103e78:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103e7b:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
80103e82:	e8 29 fd ff ff       	call   80103bb0 <sched>
  p->chan = 0;
80103e87:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
}
80103e8e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103e91:	5b                   	pop    %ebx
80103e92:	5e                   	pop    %esi
80103e93:	5f                   	pop    %edi
80103e94:	5d                   	pop    %ebp
80103e95:	c3                   	ret    
    panic("sleep without lk");
80103e96:	83 ec 0c             	sub    $0xc,%esp
80103e99:	68 ef 78 10 80       	push   $0x801078ef
80103e9e:	e8 ed c4 ff ff       	call   80100390 <panic>
    panic("sleep");
80103ea3:	83 ec 0c             	sub    $0xc,%esp
80103ea6:	68 e9 78 10 80       	push   $0x801078e9
80103eab:	e8 e0 c4 ff ff       	call   80100390 <panic>

80103eb0 <wait>:
{
80103eb0:	55                   	push   %ebp
80103eb1:	89 e5                	mov    %esp,%ebp
80103eb3:	56                   	push   %esi
80103eb4:	53                   	push   %ebx
  pushcli();
80103eb5:	e8 46 04 00 00       	call   80104300 <pushcli>
  c = mycpu();
80103eba:	e8 f1 f8 ff ff       	call   801037b0 <mycpu>
  p = c->proc;
80103ebf:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103ec5:	e8 76 04 00 00       	call   80104340 <popcli>
  acquire(&ptable.lock);
80103eca:	83 ec 0c             	sub    $0xc,%esp
80103ecd:	68 20 2d 11 80       	push   $0x80112d20
80103ed2:	e8 f9 04 00 00       	call   801043d0 <acquire>
80103ed7:	83 c4 10             	add    $0x10,%esp
    havekids = 0;
80103eda:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103edc:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
80103ee1:	eb 13                	jmp    80103ef6 <wait+0x46>
80103ee3:	90                   	nop
80103ee4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103ee8:	81 c3 a0 00 00 00    	add    $0xa0,%ebx
80103eee:	81 fb 54 55 11 80    	cmp    $0x80115554,%ebx
80103ef4:	73 1e                	jae    80103f14 <wait+0x64>
      if(p->parent != curproc)
80103ef6:	39 73 14             	cmp    %esi,0x14(%ebx)
80103ef9:	75 ed                	jne    80103ee8 <wait+0x38>
      if(p->state == ZOMBIE){
80103efb:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103eff:	74 37                	je     80103f38 <wait+0x88>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f01:	81 c3 a0 00 00 00    	add    $0xa0,%ebx
      havekids = 1;
80103f07:	b8 01 00 00 00       	mov    $0x1,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f0c:	81 fb 54 55 11 80    	cmp    $0x80115554,%ebx
80103f12:	72 e2                	jb     80103ef6 <wait+0x46>
    if(!havekids || curproc->killed){
80103f14:	85 c0                	test   %eax,%eax
80103f16:	74 76                	je     80103f8e <wait+0xde>
80103f18:	8b 46 24             	mov    0x24(%esi),%eax
80103f1b:	85 c0                	test   %eax,%eax
80103f1d:	75 6f                	jne    80103f8e <wait+0xde>
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80103f1f:	83 ec 08             	sub    $0x8,%esp
80103f22:	68 20 2d 11 80       	push   $0x80112d20
80103f27:	56                   	push   %esi
80103f28:	e8 c3 fe ff ff       	call   80103df0 <sleep>
    havekids = 0;
80103f2d:	83 c4 10             	add    $0x10,%esp
80103f30:	eb a8                	jmp    80103eda <wait+0x2a>
80103f32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        kfree(p->kstack);
80103f38:	83 ec 0c             	sub    $0xc,%esp
80103f3b:	ff 73 08             	pushl  0x8(%ebx)
        pid = p->pid;
80103f3e:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80103f41:	e8 da e3 ff ff       	call   80102320 <kfree>
        freevm(p->pgdir);
80103f46:	5a                   	pop    %edx
80103f47:	ff 73 04             	pushl  0x4(%ebx)
        p->kstack = 0;
80103f4a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80103f51:	e8 6a 30 00 00       	call   80106fc0 <freevm>
        release(&ptable.lock);
80103f56:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
        p->pid = 0;
80103f5d:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80103f64:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80103f6b:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80103f6f:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80103f76:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80103f7d:	e8 0e 05 00 00       	call   80104490 <release>
        return pid;
80103f82:	83 c4 10             	add    $0x10,%esp
}
80103f85:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103f88:	89 f0                	mov    %esi,%eax
80103f8a:	5b                   	pop    %ebx
80103f8b:	5e                   	pop    %esi
80103f8c:	5d                   	pop    %ebp
80103f8d:	c3                   	ret    
      release(&ptable.lock);
80103f8e:	83 ec 0c             	sub    $0xc,%esp
      return -1;
80103f91:	be ff ff ff ff       	mov    $0xffffffff,%esi
      release(&ptable.lock);
80103f96:	68 20 2d 11 80       	push   $0x80112d20
80103f9b:	e8 f0 04 00 00       	call   80104490 <release>
      return -1;
80103fa0:	83 c4 10             	add    $0x10,%esp
80103fa3:	eb e0                	jmp    80103f85 <wait+0xd5>
80103fa5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103fa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103fb0 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80103fb0:	55                   	push   %ebp
80103fb1:	89 e5                	mov    %esp,%ebp
80103fb3:	53                   	push   %ebx
80103fb4:	83 ec 10             	sub    $0x10,%esp
80103fb7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
80103fba:	68 20 2d 11 80       	push   $0x80112d20
80103fbf:	e8 0c 04 00 00       	call   801043d0 <acquire>
80103fc4:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103fc7:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103fcc:	eb 0e                	jmp    80103fdc <wakeup+0x2c>
80103fce:	66 90                	xchg   %ax,%ax
80103fd0:	05 a0 00 00 00       	add    $0xa0,%eax
80103fd5:	3d 54 55 11 80       	cmp    $0x80115554,%eax
80103fda:	73 1e                	jae    80103ffa <wakeup+0x4a>
    if(p->state == SLEEPING && p->chan == chan)
80103fdc:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103fe0:	75 ee                	jne    80103fd0 <wakeup+0x20>
80103fe2:	3b 58 20             	cmp    0x20(%eax),%ebx
80103fe5:	75 e9                	jne    80103fd0 <wakeup+0x20>
      p->state = RUNNABLE;
80103fe7:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103fee:	05 a0 00 00 00       	add    $0xa0,%eax
80103ff3:	3d 54 55 11 80       	cmp    $0x80115554,%eax
80103ff8:	72 e2                	jb     80103fdc <wakeup+0x2c>
  wakeup1(chan);
  release(&ptable.lock);
80103ffa:	c7 45 08 20 2d 11 80 	movl   $0x80112d20,0x8(%ebp)
}
80104001:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104004:	c9                   	leave  
  release(&ptable.lock);
80104005:	e9 86 04 00 00       	jmp    80104490 <release>
8010400a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104010 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80104010:	55                   	push   %ebp
80104011:	89 e5                	mov    %esp,%ebp
80104013:	53                   	push   %ebx
80104014:	83 ec 10             	sub    $0x10,%esp
80104017:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
8010401a:	68 20 2d 11 80       	push   $0x80112d20
8010401f:	e8 ac 03 00 00       	call   801043d0 <acquire>
80104024:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104027:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
8010402c:	eb 0e                	jmp    8010403c <kill+0x2c>
8010402e:	66 90                	xchg   %ax,%ax
80104030:	05 a0 00 00 00       	add    $0xa0,%eax
80104035:	3d 54 55 11 80       	cmp    $0x80115554,%eax
8010403a:	73 34                	jae    80104070 <kill+0x60>
    if(p->pid == pid){
8010403c:	39 58 10             	cmp    %ebx,0x10(%eax)
8010403f:	75 ef                	jne    80104030 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80104041:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
      p->killed = 1;
80104045:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      if(p->state == SLEEPING)
8010404c:	75 07                	jne    80104055 <kill+0x45>
        p->state = RUNNABLE;
8010404e:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
      release(&ptable.lock);
80104055:	83 ec 0c             	sub    $0xc,%esp
80104058:	68 20 2d 11 80       	push   $0x80112d20
8010405d:	e8 2e 04 00 00       	call   80104490 <release>
      return 0;
80104062:	83 c4 10             	add    $0x10,%esp
80104065:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80104067:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010406a:	c9                   	leave  
8010406b:	c3                   	ret    
8010406c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  release(&ptable.lock);
80104070:	83 ec 0c             	sub    $0xc,%esp
80104073:	68 20 2d 11 80       	push   $0x80112d20
80104078:	e8 13 04 00 00       	call   80104490 <release>
  return -1;
8010407d:	83 c4 10             	add    $0x10,%esp
80104080:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104085:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104088:	c9                   	leave  
80104089:	c3                   	ret    
8010408a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104090 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104090:	55                   	push   %ebp
80104091:	89 e5                	mov    %esp,%ebp
80104093:	57                   	push   %edi
80104094:	56                   	push   %esi
80104095:	53                   	push   %ebx
80104096:	8d 75 e8             	lea    -0x18(%ebp),%esi
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104099:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
{
8010409e:	83 ec 3c             	sub    $0x3c,%esp
801040a1:	eb 27                	jmp    801040ca <procdump+0x3a>
801040a3:	90                   	nop
801040a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
801040a8:	83 ec 0c             	sub    $0xc,%esp
801040ab:	68 df 7c 10 80       	push   $0x80107cdf
801040b0:	e8 ab c5 ff ff       	call   80100660 <cprintf>
801040b5:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801040b8:	81 c3 a0 00 00 00    	add    $0xa0,%ebx
801040be:	81 fb 54 55 11 80    	cmp    $0x80115554,%ebx
801040c4:	0f 83 86 00 00 00    	jae    80104150 <procdump+0xc0>
    if(p->state == UNUSED)
801040ca:	8b 43 0c             	mov    0xc(%ebx),%eax
801040cd:	85 c0                	test   %eax,%eax
801040cf:	74 e7                	je     801040b8 <procdump+0x28>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801040d1:	83 f8 05             	cmp    $0x5,%eax
      state = "???";
801040d4:	ba 00 79 10 80       	mov    $0x80107900,%edx
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801040d9:	77 11                	ja     801040ec <procdump+0x5c>
801040db:	8b 14 85 60 79 10 80 	mov    -0x7fef86a0(,%eax,4),%edx
      state = "???";
801040e2:	b8 00 79 10 80       	mov    $0x80107900,%eax
801040e7:	85 d2                	test   %edx,%edx
801040e9:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
801040ec:	8d 43 6c             	lea    0x6c(%ebx),%eax
801040ef:	50                   	push   %eax
801040f0:	52                   	push   %edx
801040f1:	ff 73 10             	pushl  0x10(%ebx)
801040f4:	68 04 79 10 80       	push   $0x80107904
801040f9:	e8 62 c5 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
801040fe:	83 c4 10             	add    $0x10,%esp
80104101:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
80104105:	75 a1                	jne    801040a8 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
80104107:	8d 45 c0             	lea    -0x40(%ebp),%eax
8010410a:	83 ec 08             	sub    $0x8,%esp
8010410d:	8d 7d c0             	lea    -0x40(%ebp),%edi
80104110:	50                   	push   %eax
80104111:	8b 43 1c             	mov    0x1c(%ebx),%eax
80104114:	8b 40 0c             	mov    0xc(%eax),%eax
80104117:	83 c0 08             	add    $0x8,%eax
8010411a:	50                   	push   %eax
8010411b:	e8 90 01 00 00       	call   801042b0 <getcallerpcs>
80104120:	83 c4 10             	add    $0x10,%esp
80104123:	90                   	nop
80104124:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
80104128:	8b 17                	mov    (%edi),%edx
8010412a:	85 d2                	test   %edx,%edx
8010412c:	0f 84 76 ff ff ff    	je     801040a8 <procdump+0x18>
        cprintf(" %p", pc[i]);
80104132:	83 ec 08             	sub    $0x8,%esp
80104135:	83 c7 04             	add    $0x4,%edi
80104138:	52                   	push   %edx
80104139:	68 41 73 10 80       	push   $0x80107341
8010413e:	e8 1d c5 ff ff       	call   80100660 <cprintf>
      for(i=0; i<10 && pc[i] != 0; i++)
80104143:	83 c4 10             	add    $0x10,%esp
80104146:	39 fe                	cmp    %edi,%esi
80104148:	75 de                	jne    80104128 <procdump+0x98>
8010414a:	e9 59 ff ff ff       	jmp    801040a8 <procdump+0x18>
8010414f:	90                   	nop
  }
}
80104150:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104153:	5b                   	pop    %ebx
80104154:	5e                   	pop    %esi
80104155:	5f                   	pop    %edi
80104156:	5d                   	pop    %ebp
80104157:	c3                   	ret    
80104158:	66 90                	xchg   %ax,%ax
8010415a:	66 90                	xchg   %ax,%ax
8010415c:	66 90                	xchg   %ax,%ax
8010415e:	66 90                	xchg   %ax,%ax

80104160 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80104160:	55                   	push   %ebp
80104161:	89 e5                	mov    %esp,%ebp
80104163:	53                   	push   %ebx
80104164:	83 ec 0c             	sub    $0xc,%esp
80104167:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
8010416a:	68 78 79 10 80       	push   $0x80107978
8010416f:	8d 43 04             	lea    0x4(%ebx),%eax
80104172:	50                   	push   %eax
80104173:	e8 18 01 00 00       	call   80104290 <initlock>
  lk->name = name;
80104178:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
8010417b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
80104181:	83 c4 10             	add    $0x10,%esp
  lk->pid = 0;
80104184:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  lk->name = name;
8010418b:	89 43 38             	mov    %eax,0x38(%ebx)
}
8010418e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104191:	c9                   	leave  
80104192:	c3                   	ret    
80104193:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801041a0 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
801041a0:	55                   	push   %ebp
801041a1:	89 e5                	mov    %esp,%ebp
801041a3:	56                   	push   %esi
801041a4:	53                   	push   %ebx
801041a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801041a8:	83 ec 0c             	sub    $0xc,%esp
801041ab:	8d 73 04             	lea    0x4(%ebx),%esi
801041ae:	56                   	push   %esi
801041af:	e8 1c 02 00 00       	call   801043d0 <acquire>
  while (lk->locked) {
801041b4:	8b 13                	mov    (%ebx),%edx
801041b6:	83 c4 10             	add    $0x10,%esp
801041b9:	85 d2                	test   %edx,%edx
801041bb:	74 16                	je     801041d3 <acquiresleep+0x33>
801041bd:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
801041c0:	83 ec 08             	sub    $0x8,%esp
801041c3:	56                   	push   %esi
801041c4:	53                   	push   %ebx
801041c5:	e8 26 fc ff ff       	call   80103df0 <sleep>
  while (lk->locked) {
801041ca:	8b 03                	mov    (%ebx),%eax
801041cc:	83 c4 10             	add    $0x10,%esp
801041cf:	85 c0                	test   %eax,%eax
801041d1:	75 ed                	jne    801041c0 <acquiresleep+0x20>
  }
  lk->locked = 1;
801041d3:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
801041d9:	e8 72 f6 ff ff       	call   80103850 <myproc>
801041de:	8b 40 10             	mov    0x10(%eax),%eax
801041e1:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
801041e4:	89 75 08             	mov    %esi,0x8(%ebp)
}
801041e7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801041ea:	5b                   	pop    %ebx
801041eb:	5e                   	pop    %esi
801041ec:	5d                   	pop    %ebp
  release(&lk->lk);
801041ed:	e9 9e 02 00 00       	jmp    80104490 <release>
801041f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801041f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104200 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
80104200:	55                   	push   %ebp
80104201:	89 e5                	mov    %esp,%ebp
80104203:	56                   	push   %esi
80104204:	53                   	push   %ebx
80104205:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104208:	83 ec 0c             	sub    $0xc,%esp
8010420b:	8d 73 04             	lea    0x4(%ebx),%esi
8010420e:	56                   	push   %esi
8010420f:	e8 bc 01 00 00       	call   801043d0 <acquire>
  lk->locked = 0;
80104214:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
8010421a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80104221:	89 1c 24             	mov    %ebx,(%esp)
80104224:	e8 87 fd ff ff       	call   80103fb0 <wakeup>
  release(&lk->lk);
80104229:	89 75 08             	mov    %esi,0x8(%ebp)
8010422c:	83 c4 10             	add    $0x10,%esp
}
8010422f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104232:	5b                   	pop    %ebx
80104233:	5e                   	pop    %esi
80104234:	5d                   	pop    %ebp
  release(&lk->lk);
80104235:	e9 56 02 00 00       	jmp    80104490 <release>
8010423a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104240 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
80104240:	55                   	push   %ebp
80104241:	89 e5                	mov    %esp,%ebp
80104243:	57                   	push   %edi
80104244:	56                   	push   %esi
80104245:	53                   	push   %ebx
80104246:	31 ff                	xor    %edi,%edi
80104248:	83 ec 18             	sub    $0x18,%esp
8010424b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int r;
  
  acquire(&lk->lk);
8010424e:	8d 73 04             	lea    0x4(%ebx),%esi
80104251:	56                   	push   %esi
80104252:	e8 79 01 00 00       	call   801043d0 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
80104257:	8b 03                	mov    (%ebx),%eax
80104259:	83 c4 10             	add    $0x10,%esp
8010425c:	85 c0                	test   %eax,%eax
8010425e:	74 13                	je     80104273 <holdingsleep+0x33>
80104260:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
80104263:	e8 e8 f5 ff ff       	call   80103850 <myproc>
80104268:	39 58 10             	cmp    %ebx,0x10(%eax)
8010426b:	0f 94 c0             	sete   %al
8010426e:	0f b6 c0             	movzbl %al,%eax
80104271:	89 c7                	mov    %eax,%edi
  release(&lk->lk);
80104273:	83 ec 0c             	sub    $0xc,%esp
80104276:	56                   	push   %esi
80104277:	e8 14 02 00 00       	call   80104490 <release>
  return r;
}
8010427c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010427f:	89 f8                	mov    %edi,%eax
80104281:	5b                   	pop    %ebx
80104282:	5e                   	pop    %esi
80104283:	5f                   	pop    %edi
80104284:	5d                   	pop    %ebp
80104285:	c3                   	ret    
80104286:	66 90                	xchg   %ax,%ax
80104288:	66 90                	xchg   %ax,%ax
8010428a:	66 90                	xchg   %ax,%ax
8010428c:	66 90                	xchg   %ax,%ax
8010428e:	66 90                	xchg   %ax,%ax

80104290 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80104290:	55                   	push   %ebp
80104291:	89 e5                	mov    %esp,%ebp
80104293:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
80104296:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
80104299:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->name = name;
8010429f:	89 50 04             	mov    %edx,0x4(%eax)
  lk->cpu = 0;
801042a2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
801042a9:	5d                   	pop    %ebp
801042aa:	c3                   	ret    
801042ab:	90                   	nop
801042ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801042b0 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
801042b0:	55                   	push   %ebp
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801042b1:	31 d2                	xor    %edx,%edx
{
801042b3:	89 e5                	mov    %esp,%ebp
801042b5:	53                   	push   %ebx
  ebp = (uint*)v - 2;
801042b6:	8b 45 08             	mov    0x8(%ebp),%eax
{
801042b9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  ebp = (uint*)v - 2;
801042bc:	83 e8 08             	sub    $0x8,%eax
801042bf:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801042c0:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
801042c6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801042cc:	77 1a                	ja     801042e8 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
801042ce:	8b 58 04             	mov    0x4(%eax),%ebx
801042d1:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
  for(i = 0; i < 10; i++){
801042d4:	83 c2 01             	add    $0x1,%edx
    ebp = (uint*)ebp[0]; // saved %ebp
801042d7:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
801042d9:	83 fa 0a             	cmp    $0xa,%edx
801042dc:	75 e2                	jne    801042c0 <getcallerpcs+0x10>
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
801042de:	5b                   	pop    %ebx
801042df:	5d                   	pop    %ebp
801042e0:	c3                   	ret    
801042e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801042e8:	8d 04 91             	lea    (%ecx,%edx,4),%eax
801042eb:	83 c1 28             	add    $0x28,%ecx
801042ee:	66 90                	xchg   %ax,%ax
    pcs[i] = 0;
801042f0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801042f6:	83 c0 04             	add    $0x4,%eax
  for(; i < 10; i++)
801042f9:	39 c1                	cmp    %eax,%ecx
801042fb:	75 f3                	jne    801042f0 <getcallerpcs+0x40>
}
801042fd:	5b                   	pop    %ebx
801042fe:	5d                   	pop    %ebp
801042ff:	c3                   	ret    

80104300 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104300:	55                   	push   %ebp
80104301:	89 e5                	mov    %esp,%ebp
80104303:	53                   	push   %ebx
80104304:	83 ec 04             	sub    $0x4,%esp
80104307:	9c                   	pushf  
80104308:	5b                   	pop    %ebx
  asm volatile("cli");
80104309:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
8010430a:	e8 a1 f4 ff ff       	call   801037b0 <mycpu>
8010430f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80104315:	85 c0                	test   %eax,%eax
80104317:	75 11                	jne    8010432a <pushcli+0x2a>
    mycpu()->intena = eflags & FL_IF;
80104319:	81 e3 00 02 00 00    	and    $0x200,%ebx
8010431f:	e8 8c f4 ff ff       	call   801037b0 <mycpu>
80104324:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
  mycpu()->ncli += 1;
8010432a:	e8 81 f4 ff ff       	call   801037b0 <mycpu>
8010432f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
80104336:	83 c4 04             	add    $0x4,%esp
80104339:	5b                   	pop    %ebx
8010433a:	5d                   	pop    %ebp
8010433b:	c3                   	ret    
8010433c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104340 <popcli>:

void
popcli(void)
{
80104340:	55                   	push   %ebp
80104341:	89 e5                	mov    %esp,%ebp
80104343:	83 ec 08             	sub    $0x8,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104346:	9c                   	pushf  
80104347:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80104348:	f6 c4 02             	test   $0x2,%ah
8010434b:	75 35                	jne    80104382 <popcli+0x42>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
8010434d:	e8 5e f4 ff ff       	call   801037b0 <mycpu>
80104352:	83 a8 a4 00 00 00 01 	subl   $0x1,0xa4(%eax)
80104359:	78 34                	js     8010438f <popcli+0x4f>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
8010435b:	e8 50 f4 ff ff       	call   801037b0 <mycpu>
80104360:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104366:	85 d2                	test   %edx,%edx
80104368:	74 06                	je     80104370 <popcli+0x30>
    sti();
}
8010436a:	c9                   	leave  
8010436b:	c3                   	ret    
8010436c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(mycpu()->ncli == 0 && mycpu()->intena)
80104370:	e8 3b f4 ff ff       	call   801037b0 <mycpu>
80104375:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010437b:	85 c0                	test   %eax,%eax
8010437d:	74 eb                	je     8010436a <popcli+0x2a>
  asm volatile("sti");
8010437f:	fb                   	sti    
}
80104380:	c9                   	leave  
80104381:	c3                   	ret    
    panic("popcli - interruptible");
80104382:	83 ec 0c             	sub    $0xc,%esp
80104385:	68 83 79 10 80       	push   $0x80107983
8010438a:	e8 01 c0 ff ff       	call   80100390 <panic>
    panic("popcli");
8010438f:	83 ec 0c             	sub    $0xc,%esp
80104392:	68 9a 79 10 80       	push   $0x8010799a
80104397:	e8 f4 bf ff ff       	call   80100390 <panic>
8010439c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801043a0 <holding>:
{
801043a0:	55                   	push   %ebp
801043a1:	89 e5                	mov    %esp,%ebp
801043a3:	56                   	push   %esi
801043a4:	53                   	push   %ebx
801043a5:	8b 75 08             	mov    0x8(%ebp),%esi
801043a8:	31 db                	xor    %ebx,%ebx
  pushcli();
801043aa:	e8 51 ff ff ff       	call   80104300 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
801043af:	8b 06                	mov    (%esi),%eax
801043b1:	85 c0                	test   %eax,%eax
801043b3:	74 10                	je     801043c5 <holding+0x25>
801043b5:	8b 5e 08             	mov    0x8(%esi),%ebx
801043b8:	e8 f3 f3 ff ff       	call   801037b0 <mycpu>
801043bd:	39 c3                	cmp    %eax,%ebx
801043bf:	0f 94 c3             	sete   %bl
801043c2:	0f b6 db             	movzbl %bl,%ebx
  popcli();
801043c5:	e8 76 ff ff ff       	call   80104340 <popcli>
}
801043ca:	89 d8                	mov    %ebx,%eax
801043cc:	5b                   	pop    %ebx
801043cd:	5e                   	pop    %esi
801043ce:	5d                   	pop    %ebp
801043cf:	c3                   	ret    

801043d0 <acquire>:
{
801043d0:	55                   	push   %ebp
801043d1:	89 e5                	mov    %esp,%ebp
801043d3:	56                   	push   %esi
801043d4:	53                   	push   %ebx
  pushcli(); // disable interrupts to avoid deadlock.
801043d5:	e8 26 ff ff ff       	call   80104300 <pushcli>
  if(holding(lk))
801043da:	8b 5d 08             	mov    0x8(%ebp),%ebx
801043dd:	83 ec 0c             	sub    $0xc,%esp
801043e0:	53                   	push   %ebx
801043e1:	e8 ba ff ff ff       	call   801043a0 <holding>
801043e6:	83 c4 10             	add    $0x10,%esp
801043e9:	85 c0                	test   %eax,%eax
801043eb:	0f 85 83 00 00 00    	jne    80104474 <acquire+0xa4>
801043f1:	89 c6                	mov    %eax,%esi
  asm volatile("lock; xchgl %0, %1" :
801043f3:	ba 01 00 00 00       	mov    $0x1,%edx
801043f8:	eb 09                	jmp    80104403 <acquire+0x33>
801043fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104400:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104403:	89 d0                	mov    %edx,%eax
80104405:	f0 87 03             	lock xchg %eax,(%ebx)
  while(xchg(&lk->locked, 1) != 0)
80104408:	85 c0                	test   %eax,%eax
8010440a:	75 f4                	jne    80104400 <acquire+0x30>
  __sync_synchronize();
8010440c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  lk->cpu = mycpu();
80104411:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104414:	e8 97 f3 ff ff       	call   801037b0 <mycpu>
  getcallerpcs(&lk, lk->pcs);
80104419:	8d 53 0c             	lea    0xc(%ebx),%edx
  lk->cpu = mycpu();
8010441c:	89 43 08             	mov    %eax,0x8(%ebx)
  ebp = (uint*)v - 2;
8010441f:	89 e8                	mov    %ebp,%eax
80104421:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104428:	8d 88 00 00 00 80    	lea    -0x80000000(%eax),%ecx
8010442e:	81 f9 fe ff ff 7f    	cmp    $0x7ffffffe,%ecx
80104434:	77 1a                	ja     80104450 <acquire+0x80>
    pcs[i] = ebp[1];     // saved %eip
80104436:	8b 48 04             	mov    0x4(%eax),%ecx
80104439:	89 0c b2             	mov    %ecx,(%edx,%esi,4)
  for(i = 0; i < 10; i++){
8010443c:	83 c6 01             	add    $0x1,%esi
    ebp = (uint*)ebp[0]; // saved %ebp
8010443f:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
80104441:	83 fe 0a             	cmp    $0xa,%esi
80104444:	75 e2                	jne    80104428 <acquire+0x58>
}
80104446:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104449:	5b                   	pop    %ebx
8010444a:	5e                   	pop    %esi
8010444b:	5d                   	pop    %ebp
8010444c:	c3                   	ret    
8010444d:	8d 76 00             	lea    0x0(%esi),%esi
80104450:	8d 04 b2             	lea    (%edx,%esi,4),%eax
80104453:	83 c2 28             	add    $0x28,%edx
80104456:	8d 76 00             	lea    0x0(%esi),%esi
80104459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    pcs[i] = 0;
80104460:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104466:	83 c0 04             	add    $0x4,%eax
  for(; i < 10; i++)
80104469:	39 d0                	cmp    %edx,%eax
8010446b:	75 f3                	jne    80104460 <acquire+0x90>
}
8010446d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104470:	5b                   	pop    %ebx
80104471:	5e                   	pop    %esi
80104472:	5d                   	pop    %ebp
80104473:	c3                   	ret    
    panic("acquire");
80104474:	83 ec 0c             	sub    $0xc,%esp
80104477:	68 a1 79 10 80       	push   $0x801079a1
8010447c:	e8 0f bf ff ff       	call   80100390 <panic>
80104481:	eb 0d                	jmp    80104490 <release>
80104483:	90                   	nop
80104484:	90                   	nop
80104485:	90                   	nop
80104486:	90                   	nop
80104487:	90                   	nop
80104488:	90                   	nop
80104489:	90                   	nop
8010448a:	90                   	nop
8010448b:	90                   	nop
8010448c:	90                   	nop
8010448d:	90                   	nop
8010448e:	90                   	nop
8010448f:	90                   	nop

80104490 <release>:
{
80104490:	55                   	push   %ebp
80104491:	89 e5                	mov    %esp,%ebp
80104493:	53                   	push   %ebx
80104494:	83 ec 10             	sub    $0x10,%esp
80104497:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holding(lk))
8010449a:	53                   	push   %ebx
8010449b:	e8 00 ff ff ff       	call   801043a0 <holding>
801044a0:	83 c4 10             	add    $0x10,%esp
801044a3:	85 c0                	test   %eax,%eax
801044a5:	74 22                	je     801044c9 <release+0x39>
  lk->pcs[0] = 0;
801044a7:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
801044ae:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  __sync_synchronize();
801044b5:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
801044ba:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
801044c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801044c3:	c9                   	leave  
  popcli();
801044c4:	e9 77 fe ff ff       	jmp    80104340 <popcli>
    panic("release");
801044c9:	83 ec 0c             	sub    $0xc,%esp
801044cc:	68 a9 79 10 80       	push   $0x801079a9
801044d1:	e8 ba be ff ff       	call   80100390 <panic>
801044d6:	66 90                	xchg   %ax,%ax
801044d8:	66 90                	xchg   %ax,%ax
801044da:	66 90                	xchg   %ax,%ax
801044dc:	66 90                	xchg   %ax,%ax
801044de:	66 90                	xchg   %ax,%ax

801044e0 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
801044e0:	55                   	push   %ebp
801044e1:	89 e5                	mov    %esp,%ebp
801044e3:	57                   	push   %edi
801044e4:	53                   	push   %ebx
801044e5:	8b 55 08             	mov    0x8(%ebp),%edx
801044e8:	8b 4d 10             	mov    0x10(%ebp),%ecx
  if ((int)dst%4 == 0 && n%4 == 0){
801044eb:	f6 c2 03             	test   $0x3,%dl
801044ee:	75 05                	jne    801044f5 <memset+0x15>
801044f0:	f6 c1 03             	test   $0x3,%cl
801044f3:	74 13                	je     80104508 <memset+0x28>
  asm volatile("cld; rep stosb" :
801044f5:	89 d7                	mov    %edx,%edi
801044f7:	8b 45 0c             	mov    0xc(%ebp),%eax
801044fa:	fc                   	cld    
801044fb:	f3 aa                	rep stos %al,%es:(%edi)
    c &= 0xFF;
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
801044fd:	5b                   	pop    %ebx
801044fe:	89 d0                	mov    %edx,%eax
80104500:	5f                   	pop    %edi
80104501:	5d                   	pop    %ebp
80104502:	c3                   	ret    
80104503:	90                   	nop
80104504:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c &= 0xFF;
80104508:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
8010450c:	c1 e9 02             	shr    $0x2,%ecx
8010450f:	89 f8                	mov    %edi,%eax
80104511:	89 fb                	mov    %edi,%ebx
80104513:	c1 e0 18             	shl    $0x18,%eax
80104516:	c1 e3 10             	shl    $0x10,%ebx
80104519:	09 d8                	or     %ebx,%eax
8010451b:	09 f8                	or     %edi,%eax
8010451d:	c1 e7 08             	shl    $0x8,%edi
80104520:	09 f8                	or     %edi,%eax
  asm volatile("cld; rep stosl" :
80104522:	89 d7                	mov    %edx,%edi
80104524:	fc                   	cld    
80104525:	f3 ab                	rep stos %eax,%es:(%edi)
}
80104527:	5b                   	pop    %ebx
80104528:	89 d0                	mov    %edx,%eax
8010452a:	5f                   	pop    %edi
8010452b:	5d                   	pop    %ebp
8010452c:	c3                   	ret    
8010452d:	8d 76 00             	lea    0x0(%esi),%esi

80104530 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
80104530:	55                   	push   %ebp
80104531:	89 e5                	mov    %esp,%ebp
80104533:	57                   	push   %edi
80104534:	56                   	push   %esi
80104535:	53                   	push   %ebx
80104536:	8b 5d 10             	mov    0x10(%ebp),%ebx
80104539:	8b 75 08             	mov    0x8(%ebp),%esi
8010453c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
8010453f:	85 db                	test   %ebx,%ebx
80104541:	74 29                	je     8010456c <memcmp+0x3c>
    if(*s1 != *s2)
80104543:	0f b6 16             	movzbl (%esi),%edx
80104546:	0f b6 0f             	movzbl (%edi),%ecx
80104549:	38 d1                	cmp    %dl,%cl
8010454b:	75 2b                	jne    80104578 <memcmp+0x48>
8010454d:	b8 01 00 00 00       	mov    $0x1,%eax
80104552:	eb 14                	jmp    80104568 <memcmp+0x38>
80104554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104558:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
8010455c:	83 c0 01             	add    $0x1,%eax
8010455f:	0f b6 4c 07 ff       	movzbl -0x1(%edi,%eax,1),%ecx
80104564:	38 ca                	cmp    %cl,%dl
80104566:	75 10                	jne    80104578 <memcmp+0x48>
  while(n-- > 0){
80104568:	39 d8                	cmp    %ebx,%eax
8010456a:	75 ec                	jne    80104558 <memcmp+0x28>
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
}
8010456c:	5b                   	pop    %ebx
  return 0;
8010456d:	31 c0                	xor    %eax,%eax
}
8010456f:	5e                   	pop    %esi
80104570:	5f                   	pop    %edi
80104571:	5d                   	pop    %ebp
80104572:	c3                   	ret    
80104573:	90                   	nop
80104574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return *s1 - *s2;
80104578:	0f b6 c2             	movzbl %dl,%eax
}
8010457b:	5b                   	pop    %ebx
      return *s1 - *s2;
8010457c:	29 c8                	sub    %ecx,%eax
}
8010457e:	5e                   	pop    %esi
8010457f:	5f                   	pop    %edi
80104580:	5d                   	pop    %ebp
80104581:	c3                   	ret    
80104582:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104590 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
80104590:	55                   	push   %ebp
80104591:	89 e5                	mov    %esp,%ebp
80104593:	56                   	push   %esi
80104594:	53                   	push   %ebx
80104595:	8b 45 08             	mov    0x8(%ebp),%eax
80104598:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010459b:	8b 75 10             	mov    0x10(%ebp),%esi
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
8010459e:	39 c3                	cmp    %eax,%ebx
801045a0:	73 26                	jae    801045c8 <memmove+0x38>
801045a2:	8d 0c 33             	lea    (%ebx,%esi,1),%ecx
801045a5:	39 c8                	cmp    %ecx,%eax
801045a7:	73 1f                	jae    801045c8 <memmove+0x38>
    s += n;
    d += n;
    while(n-- > 0)
801045a9:	85 f6                	test   %esi,%esi
801045ab:	8d 56 ff             	lea    -0x1(%esi),%edx
801045ae:	74 0f                	je     801045bf <memmove+0x2f>
      *--d = *--s;
801045b0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
801045b4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    while(n-- > 0)
801045b7:	83 ea 01             	sub    $0x1,%edx
801045ba:	83 fa ff             	cmp    $0xffffffff,%edx
801045bd:	75 f1                	jne    801045b0 <memmove+0x20>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
801045bf:	5b                   	pop    %ebx
801045c0:	5e                   	pop    %esi
801045c1:	5d                   	pop    %ebp
801045c2:	c3                   	ret    
801045c3:	90                   	nop
801045c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(n-- > 0)
801045c8:	31 d2                	xor    %edx,%edx
801045ca:	85 f6                	test   %esi,%esi
801045cc:	74 f1                	je     801045bf <memmove+0x2f>
801045ce:	66 90                	xchg   %ax,%ax
      *d++ = *s++;
801045d0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
801045d4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
801045d7:	83 c2 01             	add    $0x1,%edx
    while(n-- > 0)
801045da:	39 d6                	cmp    %edx,%esi
801045dc:	75 f2                	jne    801045d0 <memmove+0x40>
}
801045de:	5b                   	pop    %ebx
801045df:	5e                   	pop    %esi
801045e0:	5d                   	pop    %ebp
801045e1:	c3                   	ret    
801045e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045f0 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
801045f0:	55                   	push   %ebp
801045f1:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
}
801045f3:	5d                   	pop    %ebp
  return memmove(dst, src, n);
801045f4:	eb 9a                	jmp    80104590 <memmove>
801045f6:	8d 76 00             	lea    0x0(%esi),%esi
801045f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104600 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
80104600:	55                   	push   %ebp
80104601:	89 e5                	mov    %esp,%ebp
80104603:	57                   	push   %edi
80104604:	56                   	push   %esi
80104605:	8b 7d 10             	mov    0x10(%ebp),%edi
80104608:	53                   	push   %ebx
80104609:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010460c:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n > 0 && *p && *p == *q)
8010460f:	85 ff                	test   %edi,%edi
80104611:	74 2f                	je     80104642 <strncmp+0x42>
80104613:	0f b6 01             	movzbl (%ecx),%eax
80104616:	0f b6 1e             	movzbl (%esi),%ebx
80104619:	84 c0                	test   %al,%al
8010461b:	74 37                	je     80104654 <strncmp+0x54>
8010461d:	38 c3                	cmp    %al,%bl
8010461f:	75 33                	jne    80104654 <strncmp+0x54>
80104621:	01 f7                	add    %esi,%edi
80104623:	eb 13                	jmp    80104638 <strncmp+0x38>
80104625:	8d 76 00             	lea    0x0(%esi),%esi
80104628:	0f b6 01             	movzbl (%ecx),%eax
8010462b:	84 c0                	test   %al,%al
8010462d:	74 21                	je     80104650 <strncmp+0x50>
8010462f:	0f b6 1a             	movzbl (%edx),%ebx
80104632:	89 d6                	mov    %edx,%esi
80104634:	38 d8                	cmp    %bl,%al
80104636:	75 1c                	jne    80104654 <strncmp+0x54>
    n--, p++, q++;
80104638:	8d 56 01             	lea    0x1(%esi),%edx
8010463b:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && *p == *q)
8010463e:	39 fa                	cmp    %edi,%edx
80104640:	75 e6                	jne    80104628 <strncmp+0x28>
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}
80104642:	5b                   	pop    %ebx
    return 0;
80104643:	31 c0                	xor    %eax,%eax
}
80104645:	5e                   	pop    %esi
80104646:	5f                   	pop    %edi
80104647:	5d                   	pop    %ebp
80104648:	c3                   	ret    
80104649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104650:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
  return (uchar)*p - (uchar)*q;
80104654:	29 d8                	sub    %ebx,%eax
}
80104656:	5b                   	pop    %ebx
80104657:	5e                   	pop    %esi
80104658:	5f                   	pop    %edi
80104659:	5d                   	pop    %ebp
8010465a:	c3                   	ret    
8010465b:	90                   	nop
8010465c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104660 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
80104660:	55                   	push   %ebp
80104661:	89 e5                	mov    %esp,%ebp
80104663:	56                   	push   %esi
80104664:	53                   	push   %ebx
80104665:	8b 45 08             	mov    0x8(%ebp),%eax
80104668:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010466b:	8b 4d 10             	mov    0x10(%ebp),%ecx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
8010466e:	89 c2                	mov    %eax,%edx
80104670:	eb 19                	jmp    8010468b <strncpy+0x2b>
80104672:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104678:	83 c3 01             	add    $0x1,%ebx
8010467b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010467f:	83 c2 01             	add    $0x1,%edx
80104682:	84 c9                	test   %cl,%cl
80104684:	88 4a ff             	mov    %cl,-0x1(%edx)
80104687:	74 09                	je     80104692 <strncpy+0x32>
80104689:	89 f1                	mov    %esi,%ecx
8010468b:	85 c9                	test   %ecx,%ecx
8010468d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104690:	7f e6                	jg     80104678 <strncpy+0x18>
    ;
  while(n-- > 0)
80104692:	31 c9                	xor    %ecx,%ecx
80104694:	85 f6                	test   %esi,%esi
80104696:	7e 17                	jle    801046af <strncpy+0x4f>
80104698:	90                   	nop
80104699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    *s++ = 0;
801046a0:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
801046a4:	89 f3                	mov    %esi,%ebx
801046a6:	83 c1 01             	add    $0x1,%ecx
801046a9:	29 cb                	sub    %ecx,%ebx
  while(n-- > 0)
801046ab:	85 db                	test   %ebx,%ebx
801046ad:	7f f1                	jg     801046a0 <strncpy+0x40>
  return os;
}
801046af:	5b                   	pop    %ebx
801046b0:	5e                   	pop    %esi
801046b1:	5d                   	pop    %ebp
801046b2:	c3                   	ret    
801046b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801046b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046c0 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
801046c0:	55                   	push   %ebp
801046c1:	89 e5                	mov    %esp,%ebp
801046c3:	56                   	push   %esi
801046c4:	53                   	push   %ebx
801046c5:	8b 4d 10             	mov    0x10(%ebp),%ecx
801046c8:	8b 45 08             	mov    0x8(%ebp),%eax
801046cb:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  if(n <= 0)
801046ce:	85 c9                	test   %ecx,%ecx
801046d0:	7e 26                	jle    801046f8 <safestrcpy+0x38>
801046d2:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
801046d6:	89 c1                	mov    %eax,%ecx
801046d8:	eb 17                	jmp    801046f1 <safestrcpy+0x31>
801046da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
801046e0:	83 c2 01             	add    $0x1,%edx
801046e3:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
801046e7:	83 c1 01             	add    $0x1,%ecx
801046ea:	84 db                	test   %bl,%bl
801046ec:	88 59 ff             	mov    %bl,-0x1(%ecx)
801046ef:	74 04                	je     801046f5 <safestrcpy+0x35>
801046f1:	39 f2                	cmp    %esi,%edx
801046f3:	75 eb                	jne    801046e0 <safestrcpy+0x20>
    ;
  *s = 0;
801046f5:	c6 01 00             	movb   $0x0,(%ecx)
  return os;
}
801046f8:	5b                   	pop    %ebx
801046f9:	5e                   	pop    %esi
801046fa:	5d                   	pop    %ebp
801046fb:	c3                   	ret    
801046fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104700 <strlen>:

int
strlen(const char *s)
{
80104700:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
80104701:	31 c0                	xor    %eax,%eax
{
80104703:	89 e5                	mov    %esp,%ebp
80104705:	8b 55 08             	mov    0x8(%ebp),%edx
  for(n = 0; s[n]; n++)
80104708:	80 3a 00             	cmpb   $0x0,(%edx)
8010470b:	74 0c                	je     80104719 <strlen+0x19>
8010470d:	8d 76 00             	lea    0x0(%esi),%esi
80104710:	83 c0 01             	add    $0x1,%eax
80104713:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104717:	75 f7                	jne    80104710 <strlen+0x10>
    ;
  return n;
}
80104719:	5d                   	pop    %ebp
8010471a:	c3                   	ret    

8010471b <swtch>:
# a struct context, and save its address in *old.
# Switch stacks to new and pop previously-saved registers.

.globl swtch
swtch:
  movl 4(%esp), %eax
8010471b:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
8010471f:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-saved registers
  pushl %ebp
80104723:	55                   	push   %ebp
  pushl %ebx
80104724:	53                   	push   %ebx
  pushl %esi
80104725:	56                   	push   %esi
  pushl %edi
80104726:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
80104727:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
80104729:	89 d4                	mov    %edx,%esp

  # Load new callee-saved registers
  popl %edi
8010472b:	5f                   	pop    %edi
  popl %esi
8010472c:	5e                   	pop    %esi
  popl %ebx
8010472d:	5b                   	pop    %ebx
  popl %ebp
8010472e:	5d                   	pop    %ebp
  ret
8010472f:	c3                   	ret    

80104730 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104730:	55                   	push   %ebp
80104731:	89 e5                	mov    %esp,%ebp
80104733:	53                   	push   %ebx
80104734:	83 ec 04             	sub    $0x4,%esp
80104737:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
8010473a:	e8 11 f1 ff ff       	call   80103850 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
8010473f:	8b 00                	mov    (%eax),%eax
80104741:	39 d8                	cmp    %ebx,%eax
80104743:	76 1b                	jbe    80104760 <fetchint+0x30>
80104745:	8d 53 04             	lea    0x4(%ebx),%edx
80104748:	39 d0                	cmp    %edx,%eax
8010474a:	72 14                	jb     80104760 <fetchint+0x30>
    return -1;
  *ip = *(int*)(addr);
8010474c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010474f:	8b 13                	mov    (%ebx),%edx
80104751:	89 10                	mov    %edx,(%eax)
  return 0;
80104753:	31 c0                	xor    %eax,%eax
}
80104755:	83 c4 04             	add    $0x4,%esp
80104758:	5b                   	pop    %ebx
80104759:	5d                   	pop    %ebp
8010475a:	c3                   	ret    
8010475b:	90                   	nop
8010475c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104760:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104765:	eb ee                	jmp    80104755 <fetchint+0x25>
80104767:	89 f6                	mov    %esi,%esi
80104769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104770 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104770:	55                   	push   %ebp
80104771:	89 e5                	mov    %esp,%ebp
80104773:	53                   	push   %ebx
80104774:	83 ec 04             	sub    $0x4,%esp
80104777:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
8010477a:	e8 d1 f0 ff ff       	call   80103850 <myproc>

  if(addr >= curproc->sz)
8010477f:	39 18                	cmp    %ebx,(%eax)
80104781:	76 29                	jbe    801047ac <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
80104783:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104786:	89 da                	mov    %ebx,%edx
80104788:	89 19                	mov    %ebx,(%ecx)
  ep = (char*)curproc->sz;
8010478a:	8b 00                	mov    (%eax),%eax
  for(s = *pp; s < ep; s++){
8010478c:	39 c3                	cmp    %eax,%ebx
8010478e:	73 1c                	jae    801047ac <fetchstr+0x3c>
    if(*s == 0)
80104790:	80 3b 00             	cmpb   $0x0,(%ebx)
80104793:	75 10                	jne    801047a5 <fetchstr+0x35>
80104795:	eb 39                	jmp    801047d0 <fetchstr+0x60>
80104797:	89 f6                	mov    %esi,%esi
80104799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801047a0:	80 3a 00             	cmpb   $0x0,(%edx)
801047a3:	74 1b                	je     801047c0 <fetchstr+0x50>
  for(s = *pp; s < ep; s++){
801047a5:	83 c2 01             	add    $0x1,%edx
801047a8:	39 d0                	cmp    %edx,%eax
801047aa:	77 f4                	ja     801047a0 <fetchstr+0x30>
    return -1;
801047ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return s - *pp;
  }
  return -1;
}
801047b1:	83 c4 04             	add    $0x4,%esp
801047b4:	5b                   	pop    %ebx
801047b5:	5d                   	pop    %ebp
801047b6:	c3                   	ret    
801047b7:	89 f6                	mov    %esi,%esi
801047b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801047c0:	83 c4 04             	add    $0x4,%esp
801047c3:	89 d0                	mov    %edx,%eax
801047c5:	29 d8                	sub    %ebx,%eax
801047c7:	5b                   	pop    %ebx
801047c8:	5d                   	pop    %ebp
801047c9:	c3                   	ret    
801047ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(*s == 0)
801047d0:	31 c0                	xor    %eax,%eax
      return s - *pp;
801047d2:	eb dd                	jmp    801047b1 <fetchstr+0x41>
801047d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801047da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801047e0 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
801047e0:	55                   	push   %ebp
801047e1:	89 e5                	mov    %esp,%ebp
801047e3:	56                   	push   %esi
801047e4:	53                   	push   %ebx
	return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
801047e5:	e8 66 f0 ff ff       	call   80103850 <myproc>
801047ea:	8b 40 18             	mov    0x18(%eax),%eax
801047ed:	8b 55 08             	mov    0x8(%ebp),%edx
801047f0:	8b 40 44             	mov    0x44(%eax),%eax
801047f3:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
  struct proc *curproc = myproc();
801047f6:	e8 55 f0 ff ff       	call   80103850 <myproc>
  if(addr >= curproc->sz || addr+4 > curproc->sz)
801047fb:	8b 00                	mov    (%eax),%eax
	return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
801047fd:	8d 73 04             	lea    0x4(%ebx),%esi
  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104800:	39 c6                	cmp    %eax,%esi
80104802:	73 1c                	jae    80104820 <argint+0x40>
80104804:	8d 53 08             	lea    0x8(%ebx),%edx
80104807:	39 d0                	cmp    %edx,%eax
80104809:	72 15                	jb     80104820 <argint+0x40>
  *ip = *(int*)(addr);
8010480b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010480e:	8b 53 04             	mov    0x4(%ebx),%edx
80104811:	89 10                	mov    %edx,(%eax)
  return 0;
80104813:	31 c0                	xor    %eax,%eax
}
80104815:	5b                   	pop    %ebx
80104816:	5e                   	pop    %esi
80104817:	5d                   	pop    %ebp
80104818:	c3                   	ret    
80104819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104820:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
	return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104825:	eb ee                	jmp    80104815 <argint+0x35>
80104827:	89 f6                	mov    %esi,%esi
80104829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104830 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104830:	55                   	push   %ebp
80104831:	89 e5                	mov    %esp,%ebp
80104833:	56                   	push   %esi
80104834:	53                   	push   %ebx
80104835:	83 ec 10             	sub    $0x10,%esp
80104838:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int i;
  struct proc *curproc = myproc();
8010483b:	e8 10 f0 ff ff       	call   80103850 <myproc>
80104840:	89 c6                	mov    %eax,%esi

  if(argint(n, &i) < 0)
80104842:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104845:	83 ec 08             	sub    $0x8,%esp
80104848:	50                   	push   %eax
80104849:	ff 75 08             	pushl  0x8(%ebp)
8010484c:	e8 8f ff ff ff       	call   801047e0 <argint>
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
80104851:	83 c4 10             	add    $0x10,%esp
80104854:	85 c0                	test   %eax,%eax
80104856:	78 28                	js     80104880 <argptr+0x50>
80104858:	85 db                	test   %ebx,%ebx
8010485a:	78 24                	js     80104880 <argptr+0x50>
8010485c:	8b 16                	mov    (%esi),%edx
8010485e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104861:	39 c2                	cmp    %eax,%edx
80104863:	76 1b                	jbe    80104880 <argptr+0x50>
80104865:	01 c3                	add    %eax,%ebx
80104867:	39 da                	cmp    %ebx,%edx
80104869:	72 15                	jb     80104880 <argptr+0x50>
    return -1;
  *pp = (char*)i;
8010486b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010486e:	89 02                	mov    %eax,(%edx)
  
	return 0;
80104870:	31 c0                	xor    %eax,%eax
}
80104872:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104875:	5b                   	pop    %ebx
80104876:	5e                   	pop    %esi
80104877:	5d                   	pop    %ebp
80104878:	c3                   	ret    
80104879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104880:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104885:	eb eb                	jmp    80104872 <argptr+0x42>
80104887:	89 f6                	mov    %esi,%esi
80104889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104890 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104890:	55                   	push   %ebp
80104891:	89 e5                	mov    %esp,%ebp
80104893:	83 ec 20             	sub    $0x20,%esp
  int addr;
  if(argint(n, &addr) < 0)
80104896:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104899:	50                   	push   %eax
8010489a:	ff 75 08             	pushl  0x8(%ebp)
8010489d:	e8 3e ff ff ff       	call   801047e0 <argint>
801048a2:	83 c4 10             	add    $0x10,%esp
801048a5:	85 c0                	test   %eax,%eax
801048a7:	78 17                	js     801048c0 <argstr+0x30>
    return -1;
  return fetchstr(addr, pp);
801048a9:	83 ec 08             	sub    $0x8,%esp
801048ac:	ff 75 0c             	pushl  0xc(%ebp)
801048af:	ff 75 f4             	pushl  -0xc(%ebp)
801048b2:	e8 b9 fe ff ff       	call   80104770 <fetchstr>
801048b7:	83 c4 10             	add    $0x10,%esp
}
801048ba:	c9                   	leave  
801048bb:	c3                   	ret    
801048bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
801048c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801048c5:	c9                   	leave  
801048c6:	c3                   	ret    
801048c7:	89 f6                	mov    %esi,%esi
801048c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801048d0 <syscall>:
};
*/

void
syscall(void)
{
801048d0:	55                   	push   %ebp
801048d1:	89 e5                	mov    %esp,%ebp
801048d3:	53                   	push   %ebx
801048d4:	83 ec 04             	sub    $0x4,%esp
  int num;
  struct proc *curproc = myproc();
801048d7:	e8 74 ef ff ff       	call   80103850 <myproc>
801048dc:	89 c3                	mov    %eax,%ebx

	num = curproc->tf->eax;
801048de:	8b 40 18             	mov    0x18(%eax),%eax
801048e1:	8b 40 1c             	mov    0x1c(%eax),%eax
	if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
801048e4:	8d 50 ff             	lea    -0x1(%eax),%edx
801048e7:	83 fa 16             	cmp    $0x16,%edx
801048ea:	77 1c                	ja     80104908 <syscall+0x38>
801048ec:	8b 14 85 e0 79 10 80 	mov    -0x7fef8620(,%eax,4),%edx
801048f3:	85 d2                	test   %edx,%edx
801048f5:	74 11                	je     80104908 <syscall+0x38>
		curproc->tf->eax = syscalls[num]();
801048f7:	ff d2                	call   *%edx
801048f9:	8b 53 18             	mov    0x18(%ebx),%edx
801048fc:	89 42 1c             	mov    %eax,0x1c(%edx)
	} else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
};
801048ff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104902:	c9                   	leave  
80104903:	c3                   	ret    
80104904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf("%d %s: unknown sys call %d\n",
80104908:	50                   	push   %eax
            curproc->pid, curproc->name, num);
80104909:	8d 43 6c             	lea    0x6c(%ebx),%eax
    cprintf("%d %s: unknown sys call %d\n",
8010490c:	50                   	push   %eax
8010490d:	ff 73 10             	pushl  0x10(%ebx)
80104910:	68 b1 79 10 80       	push   $0x801079b1
80104915:	e8 46 bd ff ff       	call   80100660 <cprintf>
    curproc->tf->eax = -1;
8010491a:	8b 43 18             	mov    0x18(%ebx),%eax
8010491d:	83 c4 10             	add    $0x10,%esp
80104920:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
};
80104927:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010492a:	c9                   	leave  
8010492b:	c3                   	ret    
8010492c:	66 90                	xchg   %ax,%ax
8010492e:	66 90                	xchg   %ax,%ax

80104930 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104930:	55                   	push   %ebp
80104931:	89 e5                	mov    %esp,%ebp
80104933:	57                   	push   %edi
80104934:	56                   	push   %esi
80104935:	53                   	push   %ebx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104936:	8d 75 da             	lea    -0x26(%ebp),%esi
{
80104939:	83 ec 44             	sub    $0x44,%esp
8010493c:	89 4d c0             	mov    %ecx,-0x40(%ebp)
8010493f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  if((dp = nameiparent(path, name)) == 0)
80104942:	56                   	push   %esi
80104943:	50                   	push   %eax
{
80104944:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80104947:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  if((dp = nameiparent(path, name)) == 0)
8010494a:	e8 c1 d5 ff ff       	call   80101f10 <nameiparent>
8010494f:	83 c4 10             	add    $0x10,%esp
80104952:	85 c0                	test   %eax,%eax
80104954:	0f 84 46 01 00 00    	je     80104aa0 <create+0x170>
    return 0;
  ilock(dp);
8010495a:	83 ec 0c             	sub    $0xc,%esp
8010495d:	89 c3                	mov    %eax,%ebx
8010495f:	50                   	push   %eax
80104960:	e8 2b cd ff ff       	call   80101690 <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
80104965:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104968:	83 c4 0c             	add    $0xc,%esp
8010496b:	50                   	push   %eax
8010496c:	56                   	push   %esi
8010496d:	53                   	push   %ebx
8010496e:	e8 4d d2 ff ff       	call   80101bc0 <dirlookup>
80104973:	83 c4 10             	add    $0x10,%esp
80104976:	85 c0                	test   %eax,%eax
80104978:	89 c7                	mov    %eax,%edi
8010497a:	74 34                	je     801049b0 <create+0x80>
    iunlockput(dp);
8010497c:	83 ec 0c             	sub    $0xc,%esp
8010497f:	53                   	push   %ebx
80104980:	e8 9b cf ff ff       	call   80101920 <iunlockput>
    ilock(ip);
80104985:	89 3c 24             	mov    %edi,(%esp)
80104988:	e8 03 cd ff ff       	call   80101690 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
8010498d:	83 c4 10             	add    $0x10,%esp
80104990:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104995:	0f 85 95 00 00 00    	jne    80104a30 <create+0x100>
8010499b:	66 83 7f 50 02       	cmpw   $0x2,0x50(%edi)
801049a0:	0f 85 8a 00 00 00    	jne    80104a30 <create+0x100>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
801049a6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801049a9:	89 f8                	mov    %edi,%eax
801049ab:	5b                   	pop    %ebx
801049ac:	5e                   	pop    %esi
801049ad:	5f                   	pop    %edi
801049ae:	5d                   	pop    %ebp
801049af:	c3                   	ret    
  if((ip = ialloc(dp->dev, type)) == 0)
801049b0:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
801049b4:	83 ec 08             	sub    $0x8,%esp
801049b7:	50                   	push   %eax
801049b8:	ff 33                	pushl  (%ebx)
801049ba:	e8 61 cb ff ff       	call   80101520 <ialloc>
801049bf:	83 c4 10             	add    $0x10,%esp
801049c2:	85 c0                	test   %eax,%eax
801049c4:	89 c7                	mov    %eax,%edi
801049c6:	0f 84 e8 00 00 00    	je     80104ab4 <create+0x184>
  ilock(ip);
801049cc:	83 ec 0c             	sub    $0xc,%esp
801049cf:	50                   	push   %eax
801049d0:	e8 bb cc ff ff       	call   80101690 <ilock>
  ip->major = major;
801049d5:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
801049d9:	66 89 47 52          	mov    %ax,0x52(%edi)
  ip->minor = minor;
801049dd:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
801049e1:	66 89 47 54          	mov    %ax,0x54(%edi)
  ip->nlink = 1;
801049e5:	b8 01 00 00 00       	mov    $0x1,%eax
801049ea:	66 89 47 56          	mov    %ax,0x56(%edi)
  iupdate(ip);
801049ee:	89 3c 24             	mov    %edi,(%esp)
801049f1:	e8 ea cb ff ff       	call   801015e0 <iupdate>
  if(type == T_DIR){  // Create . and .. entries.
801049f6:	83 c4 10             	add    $0x10,%esp
801049f9:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
801049fe:	74 50                	je     80104a50 <create+0x120>
  if(dirlink(dp, name, ip->inum) < 0)
80104a00:	83 ec 04             	sub    $0x4,%esp
80104a03:	ff 77 04             	pushl  0x4(%edi)
80104a06:	56                   	push   %esi
80104a07:	53                   	push   %ebx
80104a08:	e8 23 d4 ff ff       	call   80101e30 <dirlink>
80104a0d:	83 c4 10             	add    $0x10,%esp
80104a10:	85 c0                	test   %eax,%eax
80104a12:	0f 88 8f 00 00 00    	js     80104aa7 <create+0x177>
  iunlockput(dp);
80104a18:	83 ec 0c             	sub    $0xc,%esp
80104a1b:	53                   	push   %ebx
80104a1c:	e8 ff ce ff ff       	call   80101920 <iunlockput>
  return ip;
80104a21:	83 c4 10             	add    $0x10,%esp
}
80104a24:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104a27:	89 f8                	mov    %edi,%eax
80104a29:	5b                   	pop    %ebx
80104a2a:	5e                   	pop    %esi
80104a2b:	5f                   	pop    %edi
80104a2c:	5d                   	pop    %ebp
80104a2d:	c3                   	ret    
80104a2e:	66 90                	xchg   %ax,%ax
    iunlockput(ip);
80104a30:	83 ec 0c             	sub    $0xc,%esp
80104a33:	57                   	push   %edi
    return 0;
80104a34:	31 ff                	xor    %edi,%edi
    iunlockput(ip);
80104a36:	e8 e5 ce ff ff       	call   80101920 <iunlockput>
    return 0;
80104a3b:	83 c4 10             	add    $0x10,%esp
}
80104a3e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104a41:	89 f8                	mov    %edi,%eax
80104a43:	5b                   	pop    %ebx
80104a44:	5e                   	pop    %esi
80104a45:	5f                   	pop    %edi
80104a46:	5d                   	pop    %ebp
80104a47:	c3                   	ret    
80104a48:	90                   	nop
80104a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    dp->nlink++;  // for ".."
80104a50:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
    iupdate(dp);
80104a55:	83 ec 0c             	sub    $0xc,%esp
80104a58:	53                   	push   %ebx
80104a59:	e8 82 cb ff ff       	call   801015e0 <iupdate>
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104a5e:	83 c4 0c             	add    $0xc,%esp
80104a61:	ff 77 04             	pushl  0x4(%edi)
80104a64:	68 5c 7a 10 80       	push   $0x80107a5c
80104a69:	57                   	push   %edi
80104a6a:	e8 c1 d3 ff ff       	call   80101e30 <dirlink>
80104a6f:	83 c4 10             	add    $0x10,%esp
80104a72:	85 c0                	test   %eax,%eax
80104a74:	78 1c                	js     80104a92 <create+0x162>
80104a76:	83 ec 04             	sub    $0x4,%esp
80104a79:	ff 73 04             	pushl  0x4(%ebx)
80104a7c:	68 5b 7a 10 80       	push   $0x80107a5b
80104a81:	57                   	push   %edi
80104a82:	e8 a9 d3 ff ff       	call   80101e30 <dirlink>
80104a87:	83 c4 10             	add    $0x10,%esp
80104a8a:	85 c0                	test   %eax,%eax
80104a8c:	0f 89 6e ff ff ff    	jns    80104a00 <create+0xd0>
      panic("create dots");
80104a92:	83 ec 0c             	sub    $0xc,%esp
80104a95:	68 4f 7a 10 80       	push   $0x80107a4f
80104a9a:	e8 f1 b8 ff ff       	call   80100390 <panic>
80104a9f:	90                   	nop
    return 0;
80104aa0:	31 ff                	xor    %edi,%edi
80104aa2:	e9 ff fe ff ff       	jmp    801049a6 <create+0x76>
    panic("create: dirlink");
80104aa7:	83 ec 0c             	sub    $0xc,%esp
80104aaa:	68 5e 7a 10 80       	push   $0x80107a5e
80104aaf:	e8 dc b8 ff ff       	call   80100390 <panic>
    panic("create: ialloc");
80104ab4:	83 ec 0c             	sub    $0xc,%esp
80104ab7:	68 40 7a 10 80       	push   $0x80107a40
80104abc:	e8 cf b8 ff ff       	call   80100390 <panic>
80104ac1:	eb 0d                	jmp    80104ad0 <argfd.constprop.0>
80104ac3:	90                   	nop
80104ac4:	90                   	nop
80104ac5:	90                   	nop
80104ac6:	90                   	nop
80104ac7:	90                   	nop
80104ac8:	90                   	nop
80104ac9:	90                   	nop
80104aca:	90                   	nop
80104acb:	90                   	nop
80104acc:	90                   	nop
80104acd:	90                   	nop
80104ace:	90                   	nop
80104acf:	90                   	nop

80104ad0 <argfd.constprop.0>:
argfd(int n, int *pfd, struct file **pf)
80104ad0:	55                   	push   %ebp
80104ad1:	89 e5                	mov    %esp,%ebp
80104ad3:	56                   	push   %esi
80104ad4:	53                   	push   %ebx
80104ad5:	89 c3                	mov    %eax,%ebx
  if(argint(n, &fd) < 0)
80104ad7:	8d 45 f4             	lea    -0xc(%ebp),%eax
argfd(int n, int *pfd, struct file **pf)
80104ada:	89 d6                	mov    %edx,%esi
80104adc:	83 ec 18             	sub    $0x18,%esp
  if(argint(n, &fd) < 0)
80104adf:	50                   	push   %eax
80104ae0:	6a 00                	push   $0x0
80104ae2:	e8 f9 fc ff ff       	call   801047e0 <argint>
80104ae7:	83 c4 10             	add    $0x10,%esp
80104aea:	85 c0                	test   %eax,%eax
80104aec:	78 2a                	js     80104b18 <argfd.constprop.0+0x48>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
80104aee:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104af2:	77 24                	ja     80104b18 <argfd.constprop.0+0x48>
80104af4:	e8 57 ed ff ff       	call   80103850 <myproc>
80104af9:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104afc:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104b00:	85 c0                	test   %eax,%eax
80104b02:	74 14                	je     80104b18 <argfd.constprop.0+0x48>
  if(pfd)
80104b04:	85 db                	test   %ebx,%ebx
80104b06:	74 02                	je     80104b0a <argfd.constprop.0+0x3a>
    *pfd = fd;
80104b08:	89 13                	mov    %edx,(%ebx)
    *pf = f;
80104b0a:	89 06                	mov    %eax,(%esi)
  return 0;
80104b0c:	31 c0                	xor    %eax,%eax
}
80104b0e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104b11:	5b                   	pop    %ebx
80104b12:	5e                   	pop    %esi
80104b13:	5d                   	pop    %ebp
80104b14:	c3                   	ret    
80104b15:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80104b18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b1d:	eb ef                	jmp    80104b0e <argfd.constprop.0+0x3e>
80104b1f:	90                   	nop

80104b20 <sys_dup>:
{
80104b20:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0)
80104b21:	31 c0                	xor    %eax,%eax
{
80104b23:	89 e5                	mov    %esp,%ebp
80104b25:	56                   	push   %esi
80104b26:	53                   	push   %ebx
  if(argfd(0, 0, &f) < 0)
80104b27:	8d 55 f4             	lea    -0xc(%ebp),%edx
{
80104b2a:	83 ec 10             	sub    $0x10,%esp
  if(argfd(0, 0, &f) < 0)
80104b2d:	e8 9e ff ff ff       	call   80104ad0 <argfd.constprop.0>
80104b32:	85 c0                	test   %eax,%eax
80104b34:	78 42                	js     80104b78 <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
80104b36:	8b 75 f4             	mov    -0xc(%ebp),%esi
  for(fd = 0; fd < NOFILE; fd++){
80104b39:	31 db                	xor    %ebx,%ebx
  struct proc *curproc = myproc();
80104b3b:	e8 10 ed ff ff       	call   80103850 <myproc>
80104b40:	eb 0e                	jmp    80104b50 <sys_dup+0x30>
80104b42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(fd = 0; fd < NOFILE; fd++){
80104b48:	83 c3 01             	add    $0x1,%ebx
80104b4b:	83 fb 10             	cmp    $0x10,%ebx
80104b4e:	74 28                	je     80104b78 <sys_dup+0x58>
    if(curproc->ofile[fd] == 0){
80104b50:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104b54:	85 d2                	test   %edx,%edx
80104b56:	75 f0                	jne    80104b48 <sys_dup+0x28>
      curproc->ofile[fd] = f;
80104b58:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
  filedup(f);
80104b5c:	83 ec 0c             	sub    $0xc,%esp
80104b5f:	ff 75 f4             	pushl  -0xc(%ebp)
80104b62:	e8 89 c2 ff ff       	call   80100df0 <filedup>
  return fd;
80104b67:	83 c4 10             	add    $0x10,%esp
}
80104b6a:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104b6d:	89 d8                	mov    %ebx,%eax
80104b6f:	5b                   	pop    %ebx
80104b70:	5e                   	pop    %esi
80104b71:	5d                   	pop    %ebp
80104b72:	c3                   	ret    
80104b73:	90                   	nop
80104b74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104b78:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return -1;
80104b7b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
}
80104b80:	89 d8                	mov    %ebx,%eax
80104b82:	5b                   	pop    %ebx
80104b83:	5e                   	pop    %esi
80104b84:	5d                   	pop    %ebp
80104b85:	c3                   	ret    
80104b86:	8d 76 00             	lea    0x0(%esi),%esi
80104b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b90 <sys_read>:
{
80104b90:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104b91:	31 c0                	xor    %eax,%eax
{
80104b93:	89 e5                	mov    %esp,%ebp
80104b95:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104b98:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104b9b:	e8 30 ff ff ff       	call   80104ad0 <argfd.constprop.0>
80104ba0:	85 c0                	test   %eax,%eax
80104ba2:	78 4c                	js     80104bf0 <sys_read+0x60>
80104ba4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104ba7:	83 ec 08             	sub    $0x8,%esp
80104baa:	50                   	push   %eax
80104bab:	6a 02                	push   $0x2
80104bad:	e8 2e fc ff ff       	call   801047e0 <argint>
80104bb2:	83 c4 10             	add    $0x10,%esp
80104bb5:	85 c0                	test   %eax,%eax
80104bb7:	78 37                	js     80104bf0 <sys_read+0x60>
80104bb9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104bbc:	83 ec 04             	sub    $0x4,%esp
80104bbf:	ff 75 f0             	pushl  -0x10(%ebp)
80104bc2:	50                   	push   %eax
80104bc3:	6a 01                	push   $0x1
80104bc5:	e8 66 fc ff ff       	call   80104830 <argptr>
80104bca:	83 c4 10             	add    $0x10,%esp
80104bcd:	85 c0                	test   %eax,%eax
80104bcf:	78 1f                	js     80104bf0 <sys_read+0x60>
  return fileread(f, p, n);
80104bd1:	83 ec 04             	sub    $0x4,%esp
80104bd4:	ff 75 f0             	pushl  -0x10(%ebp)
80104bd7:	ff 75 f4             	pushl  -0xc(%ebp)
80104bda:	ff 75 ec             	pushl  -0x14(%ebp)
80104bdd:	e8 7e c3 ff ff       	call   80100f60 <fileread>
80104be2:	83 c4 10             	add    $0x10,%esp
}
80104be5:	c9                   	leave  
80104be6:	c3                   	ret    
80104be7:	89 f6                	mov    %esi,%esi
80104be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80104bf0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104bf5:	c9                   	leave  
80104bf6:	c3                   	ret    
80104bf7:	89 f6                	mov    %esi,%esi
80104bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c00 <sys_write>:
{
80104c00:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104c01:	31 c0                	xor    %eax,%eax
{
80104c03:	89 e5                	mov    %esp,%ebp
80104c05:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104c08:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104c0b:	e8 c0 fe ff ff       	call   80104ad0 <argfd.constprop.0>
80104c10:	85 c0                	test   %eax,%eax
80104c12:	78 4c                	js     80104c60 <sys_write+0x60>
80104c14:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104c17:	83 ec 08             	sub    $0x8,%esp
80104c1a:	50                   	push   %eax
80104c1b:	6a 02                	push   $0x2
80104c1d:	e8 be fb ff ff       	call   801047e0 <argint>
80104c22:	83 c4 10             	add    $0x10,%esp
80104c25:	85 c0                	test   %eax,%eax
80104c27:	78 37                	js     80104c60 <sys_write+0x60>
80104c29:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c2c:	83 ec 04             	sub    $0x4,%esp
80104c2f:	ff 75 f0             	pushl  -0x10(%ebp)
80104c32:	50                   	push   %eax
80104c33:	6a 01                	push   $0x1
80104c35:	e8 f6 fb ff ff       	call   80104830 <argptr>
80104c3a:	83 c4 10             	add    $0x10,%esp
80104c3d:	85 c0                	test   %eax,%eax
80104c3f:	78 1f                	js     80104c60 <sys_write+0x60>
  return filewrite(f, p, n);
80104c41:	83 ec 04             	sub    $0x4,%esp
80104c44:	ff 75 f0             	pushl  -0x10(%ebp)
80104c47:	ff 75 f4             	pushl  -0xc(%ebp)
80104c4a:	ff 75 ec             	pushl  -0x14(%ebp)
80104c4d:	e8 9e c3 ff ff       	call   80100ff0 <filewrite>
80104c52:	83 c4 10             	add    $0x10,%esp
}
80104c55:	c9                   	leave  
80104c56:	c3                   	ret    
80104c57:	89 f6                	mov    %esi,%esi
80104c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80104c60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104c65:	c9                   	leave  
80104c66:	c3                   	ret    
80104c67:	89 f6                	mov    %esi,%esi
80104c69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c70 <sys_close>:
{
80104c70:	55                   	push   %ebp
80104c71:	89 e5                	mov    %esp,%ebp
80104c73:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, &fd, &f) < 0)
80104c76:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104c79:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104c7c:	e8 4f fe ff ff       	call   80104ad0 <argfd.constprop.0>
80104c81:	85 c0                	test   %eax,%eax
80104c83:	78 2b                	js     80104cb0 <sys_close+0x40>
  myproc()->ofile[fd] = 0;
80104c85:	e8 c6 eb ff ff       	call   80103850 <myproc>
80104c8a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  fileclose(f);
80104c8d:	83 ec 0c             	sub    $0xc,%esp
  myproc()->ofile[fd] = 0;
80104c90:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104c97:	00 
  fileclose(f);
80104c98:	ff 75 f4             	pushl  -0xc(%ebp)
80104c9b:	e8 a0 c1 ff ff       	call   80100e40 <fileclose>
  return 0;
80104ca0:	83 c4 10             	add    $0x10,%esp
80104ca3:	31 c0                	xor    %eax,%eax
}
80104ca5:	c9                   	leave  
80104ca6:	c3                   	ret    
80104ca7:	89 f6                	mov    %esi,%esi
80104ca9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80104cb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104cb5:	c9                   	leave  
80104cb6:	c3                   	ret    
80104cb7:	89 f6                	mov    %esi,%esi
80104cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104cc0 <sys_fstat>:
{
80104cc0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104cc1:	31 c0                	xor    %eax,%eax
{
80104cc3:	89 e5                	mov    %esp,%ebp
80104cc5:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104cc8:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104ccb:	e8 00 fe ff ff       	call   80104ad0 <argfd.constprop.0>
80104cd0:	85 c0                	test   %eax,%eax
80104cd2:	78 2c                	js     80104d00 <sys_fstat+0x40>
80104cd4:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104cd7:	83 ec 04             	sub    $0x4,%esp
80104cda:	6a 14                	push   $0x14
80104cdc:	50                   	push   %eax
80104cdd:	6a 01                	push   $0x1
80104cdf:	e8 4c fb ff ff       	call   80104830 <argptr>
80104ce4:	83 c4 10             	add    $0x10,%esp
80104ce7:	85 c0                	test   %eax,%eax
80104ce9:	78 15                	js     80104d00 <sys_fstat+0x40>
  return filestat(f, st);
80104ceb:	83 ec 08             	sub    $0x8,%esp
80104cee:	ff 75 f4             	pushl  -0xc(%ebp)
80104cf1:	ff 75 f0             	pushl  -0x10(%ebp)
80104cf4:	e8 17 c2 ff ff       	call   80100f10 <filestat>
80104cf9:	83 c4 10             	add    $0x10,%esp
}
80104cfc:	c9                   	leave  
80104cfd:	c3                   	ret    
80104cfe:	66 90                	xchg   %ax,%ax
    return -1;
80104d00:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104d05:	c9                   	leave  
80104d06:	c3                   	ret    
80104d07:	89 f6                	mov    %esi,%esi
80104d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d10 <sys_link>:
{
80104d10:	55                   	push   %ebp
80104d11:	89 e5                	mov    %esp,%ebp
80104d13:	57                   	push   %edi
80104d14:	56                   	push   %esi
80104d15:	53                   	push   %ebx
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104d16:	8d 45 d4             	lea    -0x2c(%ebp),%eax
{
80104d19:	83 ec 34             	sub    $0x34,%esp
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104d1c:	50                   	push   %eax
80104d1d:	6a 00                	push   $0x0
80104d1f:	e8 6c fb ff ff       	call   80104890 <argstr>
80104d24:	83 c4 10             	add    $0x10,%esp
80104d27:	85 c0                	test   %eax,%eax
80104d29:	0f 88 fb 00 00 00    	js     80104e2a <sys_link+0x11a>
80104d2f:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104d32:	83 ec 08             	sub    $0x8,%esp
80104d35:	50                   	push   %eax
80104d36:	6a 01                	push   $0x1
80104d38:	e8 53 fb ff ff       	call   80104890 <argstr>
80104d3d:	83 c4 10             	add    $0x10,%esp
80104d40:	85 c0                	test   %eax,%eax
80104d42:	0f 88 e2 00 00 00    	js     80104e2a <sys_link+0x11a>
  begin_op();
80104d48:	e8 63 de ff ff       	call   80102bb0 <begin_op>
  if((ip = namei(old)) == 0){
80104d4d:	83 ec 0c             	sub    $0xc,%esp
80104d50:	ff 75 d4             	pushl  -0x2c(%ebp)
80104d53:	e8 98 d1 ff ff       	call   80101ef0 <namei>
80104d58:	83 c4 10             	add    $0x10,%esp
80104d5b:	85 c0                	test   %eax,%eax
80104d5d:	89 c3                	mov    %eax,%ebx
80104d5f:	0f 84 ea 00 00 00    	je     80104e4f <sys_link+0x13f>
  ilock(ip);
80104d65:	83 ec 0c             	sub    $0xc,%esp
80104d68:	50                   	push   %eax
80104d69:	e8 22 c9 ff ff       	call   80101690 <ilock>
  if(ip->type == T_DIR){
80104d6e:	83 c4 10             	add    $0x10,%esp
80104d71:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104d76:	0f 84 bb 00 00 00    	je     80104e37 <sys_link+0x127>
  ip->nlink++;
80104d7c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
80104d81:	83 ec 0c             	sub    $0xc,%esp
  if((dp = nameiparent(new, name)) == 0)
80104d84:	8d 7d da             	lea    -0x26(%ebp),%edi
  iupdate(ip);
80104d87:	53                   	push   %ebx
80104d88:	e8 53 c8 ff ff       	call   801015e0 <iupdate>
  iunlock(ip);
80104d8d:	89 1c 24             	mov    %ebx,(%esp)
80104d90:	e8 db c9 ff ff       	call   80101770 <iunlock>
  if((dp = nameiparent(new, name)) == 0)
80104d95:	58                   	pop    %eax
80104d96:	5a                   	pop    %edx
80104d97:	57                   	push   %edi
80104d98:	ff 75 d0             	pushl  -0x30(%ebp)
80104d9b:	e8 70 d1 ff ff       	call   80101f10 <nameiparent>
80104da0:	83 c4 10             	add    $0x10,%esp
80104da3:	85 c0                	test   %eax,%eax
80104da5:	89 c6                	mov    %eax,%esi
80104da7:	74 5b                	je     80104e04 <sys_link+0xf4>
  ilock(dp);
80104da9:	83 ec 0c             	sub    $0xc,%esp
80104dac:	50                   	push   %eax
80104dad:	e8 de c8 ff ff       	call   80101690 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104db2:	83 c4 10             	add    $0x10,%esp
80104db5:	8b 03                	mov    (%ebx),%eax
80104db7:	39 06                	cmp    %eax,(%esi)
80104db9:	75 3d                	jne    80104df8 <sys_link+0xe8>
80104dbb:	83 ec 04             	sub    $0x4,%esp
80104dbe:	ff 73 04             	pushl  0x4(%ebx)
80104dc1:	57                   	push   %edi
80104dc2:	56                   	push   %esi
80104dc3:	e8 68 d0 ff ff       	call   80101e30 <dirlink>
80104dc8:	83 c4 10             	add    $0x10,%esp
80104dcb:	85 c0                	test   %eax,%eax
80104dcd:	78 29                	js     80104df8 <sys_link+0xe8>
  iunlockput(dp);
80104dcf:	83 ec 0c             	sub    $0xc,%esp
80104dd2:	56                   	push   %esi
80104dd3:	e8 48 cb ff ff       	call   80101920 <iunlockput>
  iput(ip);
80104dd8:	89 1c 24             	mov    %ebx,(%esp)
80104ddb:	e8 e0 c9 ff ff       	call   801017c0 <iput>
  end_op();
80104de0:	e8 3b de ff ff       	call   80102c20 <end_op>
  return 0;
80104de5:	83 c4 10             	add    $0x10,%esp
80104de8:	31 c0                	xor    %eax,%eax
}
80104dea:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ded:	5b                   	pop    %ebx
80104dee:	5e                   	pop    %esi
80104def:	5f                   	pop    %edi
80104df0:	5d                   	pop    %ebp
80104df1:	c3                   	ret    
80104df2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    iunlockput(dp);
80104df8:	83 ec 0c             	sub    $0xc,%esp
80104dfb:	56                   	push   %esi
80104dfc:	e8 1f cb ff ff       	call   80101920 <iunlockput>
    goto bad;
80104e01:	83 c4 10             	add    $0x10,%esp
  ilock(ip);
80104e04:	83 ec 0c             	sub    $0xc,%esp
80104e07:	53                   	push   %ebx
80104e08:	e8 83 c8 ff ff       	call   80101690 <ilock>
  ip->nlink--;
80104e0d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104e12:	89 1c 24             	mov    %ebx,(%esp)
80104e15:	e8 c6 c7 ff ff       	call   801015e0 <iupdate>
  iunlockput(ip);
80104e1a:	89 1c 24             	mov    %ebx,(%esp)
80104e1d:	e8 fe ca ff ff       	call   80101920 <iunlockput>
  end_op();
80104e22:	e8 f9 dd ff ff       	call   80102c20 <end_op>
  return -1;
80104e27:	83 c4 10             	add    $0x10,%esp
}
80104e2a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
80104e2d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104e32:	5b                   	pop    %ebx
80104e33:	5e                   	pop    %esi
80104e34:	5f                   	pop    %edi
80104e35:	5d                   	pop    %ebp
80104e36:	c3                   	ret    
    iunlockput(ip);
80104e37:	83 ec 0c             	sub    $0xc,%esp
80104e3a:	53                   	push   %ebx
80104e3b:	e8 e0 ca ff ff       	call   80101920 <iunlockput>
    end_op();
80104e40:	e8 db dd ff ff       	call   80102c20 <end_op>
    return -1;
80104e45:	83 c4 10             	add    $0x10,%esp
80104e48:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e4d:	eb 9b                	jmp    80104dea <sys_link+0xda>
    end_op();
80104e4f:	e8 cc dd ff ff       	call   80102c20 <end_op>
    return -1;
80104e54:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e59:	eb 8f                	jmp    80104dea <sys_link+0xda>
80104e5b:	90                   	nop
80104e5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104e60 <sys_unlink>:
{
80104e60:	55                   	push   %ebp
80104e61:	89 e5                	mov    %esp,%ebp
80104e63:	57                   	push   %edi
80104e64:	56                   	push   %esi
80104e65:	53                   	push   %ebx
  if(argstr(0, &path) < 0)
80104e66:	8d 45 c0             	lea    -0x40(%ebp),%eax
{
80104e69:	83 ec 44             	sub    $0x44,%esp
  if(argstr(0, &path) < 0)
80104e6c:	50                   	push   %eax
80104e6d:	6a 00                	push   $0x0
80104e6f:	e8 1c fa ff ff       	call   80104890 <argstr>
80104e74:	83 c4 10             	add    $0x10,%esp
80104e77:	85 c0                	test   %eax,%eax
80104e79:	0f 88 77 01 00 00    	js     80104ff6 <sys_unlink+0x196>
  if((dp = nameiparent(path, name)) == 0){
80104e7f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  begin_op();
80104e82:	e8 29 dd ff ff       	call   80102bb0 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80104e87:	83 ec 08             	sub    $0x8,%esp
80104e8a:	53                   	push   %ebx
80104e8b:	ff 75 c0             	pushl  -0x40(%ebp)
80104e8e:	e8 7d d0 ff ff       	call   80101f10 <nameiparent>
80104e93:	83 c4 10             	add    $0x10,%esp
80104e96:	85 c0                	test   %eax,%eax
80104e98:	89 c6                	mov    %eax,%esi
80104e9a:	0f 84 60 01 00 00    	je     80105000 <sys_unlink+0x1a0>
  ilock(dp);
80104ea0:	83 ec 0c             	sub    $0xc,%esp
80104ea3:	50                   	push   %eax
80104ea4:	e8 e7 c7 ff ff       	call   80101690 <ilock>
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80104ea9:	58                   	pop    %eax
80104eaa:	5a                   	pop    %edx
80104eab:	68 5c 7a 10 80       	push   $0x80107a5c
80104eb0:	53                   	push   %ebx
80104eb1:	e8 ea cc ff ff       	call   80101ba0 <namecmp>
80104eb6:	83 c4 10             	add    $0x10,%esp
80104eb9:	85 c0                	test   %eax,%eax
80104ebb:	0f 84 03 01 00 00    	je     80104fc4 <sys_unlink+0x164>
80104ec1:	83 ec 08             	sub    $0x8,%esp
80104ec4:	68 5b 7a 10 80       	push   $0x80107a5b
80104ec9:	53                   	push   %ebx
80104eca:	e8 d1 cc ff ff       	call   80101ba0 <namecmp>
80104ecf:	83 c4 10             	add    $0x10,%esp
80104ed2:	85 c0                	test   %eax,%eax
80104ed4:	0f 84 ea 00 00 00    	je     80104fc4 <sys_unlink+0x164>
  if((ip = dirlookup(dp, name, &off)) == 0)
80104eda:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104edd:	83 ec 04             	sub    $0x4,%esp
80104ee0:	50                   	push   %eax
80104ee1:	53                   	push   %ebx
80104ee2:	56                   	push   %esi
80104ee3:	e8 d8 cc ff ff       	call   80101bc0 <dirlookup>
80104ee8:	83 c4 10             	add    $0x10,%esp
80104eeb:	85 c0                	test   %eax,%eax
80104eed:	89 c3                	mov    %eax,%ebx
80104eef:	0f 84 cf 00 00 00    	je     80104fc4 <sys_unlink+0x164>
  ilock(ip);
80104ef5:	83 ec 0c             	sub    $0xc,%esp
80104ef8:	50                   	push   %eax
80104ef9:	e8 92 c7 ff ff       	call   80101690 <ilock>
  if(ip->nlink < 1)
80104efe:	83 c4 10             	add    $0x10,%esp
80104f01:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104f06:	0f 8e 10 01 00 00    	jle    8010501c <sys_unlink+0x1bc>
  if(ip->type == T_DIR && !isdirempty(ip)){
80104f0c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f11:	74 6d                	je     80104f80 <sys_unlink+0x120>
  memset(&de, 0, sizeof(de));
80104f13:	8d 45 d8             	lea    -0x28(%ebp),%eax
80104f16:	83 ec 04             	sub    $0x4,%esp
80104f19:	6a 10                	push   $0x10
80104f1b:	6a 00                	push   $0x0
80104f1d:	50                   	push   %eax
80104f1e:	e8 bd f5 ff ff       	call   801044e0 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104f23:	8d 45 d8             	lea    -0x28(%ebp),%eax
80104f26:	6a 10                	push   $0x10
80104f28:	ff 75 c4             	pushl  -0x3c(%ebp)
80104f2b:	50                   	push   %eax
80104f2c:	56                   	push   %esi
80104f2d:	e8 3e cb ff ff       	call   80101a70 <writei>
80104f32:	83 c4 20             	add    $0x20,%esp
80104f35:	83 f8 10             	cmp    $0x10,%eax
80104f38:	0f 85 eb 00 00 00    	jne    80105029 <sys_unlink+0x1c9>
  if(ip->type == T_DIR){
80104f3e:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f43:	0f 84 97 00 00 00    	je     80104fe0 <sys_unlink+0x180>
  iunlockput(dp);
80104f49:	83 ec 0c             	sub    $0xc,%esp
80104f4c:	56                   	push   %esi
80104f4d:	e8 ce c9 ff ff       	call   80101920 <iunlockput>
  ip->nlink--;
80104f52:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104f57:	89 1c 24             	mov    %ebx,(%esp)
80104f5a:	e8 81 c6 ff ff       	call   801015e0 <iupdate>
  iunlockput(ip);
80104f5f:	89 1c 24             	mov    %ebx,(%esp)
80104f62:	e8 b9 c9 ff ff       	call   80101920 <iunlockput>
  end_op();
80104f67:	e8 b4 dc ff ff       	call   80102c20 <end_op>
  return 0;
80104f6c:	83 c4 10             	add    $0x10,%esp
80104f6f:	31 c0                	xor    %eax,%eax
}
80104f71:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f74:	5b                   	pop    %ebx
80104f75:	5e                   	pop    %esi
80104f76:	5f                   	pop    %edi
80104f77:	5d                   	pop    %ebp
80104f78:	c3                   	ret    
80104f79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80104f80:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80104f84:	76 8d                	jbe    80104f13 <sys_unlink+0xb3>
80104f86:	bf 20 00 00 00       	mov    $0x20,%edi
80104f8b:	eb 0f                	jmp    80104f9c <sys_unlink+0x13c>
80104f8d:	8d 76 00             	lea    0x0(%esi),%esi
80104f90:	83 c7 10             	add    $0x10,%edi
80104f93:	3b 7b 58             	cmp    0x58(%ebx),%edi
80104f96:	0f 83 77 ff ff ff    	jae    80104f13 <sys_unlink+0xb3>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104f9c:	8d 45 d8             	lea    -0x28(%ebp),%eax
80104f9f:	6a 10                	push   $0x10
80104fa1:	57                   	push   %edi
80104fa2:	50                   	push   %eax
80104fa3:	53                   	push   %ebx
80104fa4:	e8 c7 c9 ff ff       	call   80101970 <readi>
80104fa9:	83 c4 10             	add    $0x10,%esp
80104fac:	83 f8 10             	cmp    $0x10,%eax
80104faf:	75 5e                	jne    8010500f <sys_unlink+0x1af>
    if(de.inum != 0)
80104fb1:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80104fb6:	74 d8                	je     80104f90 <sys_unlink+0x130>
    iunlockput(ip);
80104fb8:	83 ec 0c             	sub    $0xc,%esp
80104fbb:	53                   	push   %ebx
80104fbc:	e8 5f c9 ff ff       	call   80101920 <iunlockput>
    goto bad;
80104fc1:	83 c4 10             	add    $0x10,%esp
  iunlockput(dp);
80104fc4:	83 ec 0c             	sub    $0xc,%esp
80104fc7:	56                   	push   %esi
80104fc8:	e8 53 c9 ff ff       	call   80101920 <iunlockput>
  end_op();
80104fcd:	e8 4e dc ff ff       	call   80102c20 <end_op>
  return -1;
80104fd2:	83 c4 10             	add    $0x10,%esp
80104fd5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fda:	eb 95                	jmp    80104f71 <sys_unlink+0x111>
80104fdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dp->nlink--;
80104fe0:	66 83 6e 56 01       	subw   $0x1,0x56(%esi)
    iupdate(dp);
80104fe5:	83 ec 0c             	sub    $0xc,%esp
80104fe8:	56                   	push   %esi
80104fe9:	e8 f2 c5 ff ff       	call   801015e0 <iupdate>
80104fee:	83 c4 10             	add    $0x10,%esp
80104ff1:	e9 53 ff ff ff       	jmp    80104f49 <sys_unlink+0xe9>
    return -1;
80104ff6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ffb:	e9 71 ff ff ff       	jmp    80104f71 <sys_unlink+0x111>
    end_op();
80105000:	e8 1b dc ff ff       	call   80102c20 <end_op>
    return -1;
80105005:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010500a:	e9 62 ff ff ff       	jmp    80104f71 <sys_unlink+0x111>
      panic("isdirempty: readi");
8010500f:	83 ec 0c             	sub    $0xc,%esp
80105012:	68 80 7a 10 80       	push   $0x80107a80
80105017:	e8 74 b3 ff ff       	call   80100390 <panic>
    panic("unlink: nlink < 1");
8010501c:	83 ec 0c             	sub    $0xc,%esp
8010501f:	68 6e 7a 10 80       	push   $0x80107a6e
80105024:	e8 67 b3 ff ff       	call   80100390 <panic>
    panic("unlink: writei");
80105029:	83 ec 0c             	sub    $0xc,%esp
8010502c:	68 92 7a 10 80       	push   $0x80107a92
80105031:	e8 5a b3 ff ff       	call   80100390 <panic>
80105036:	8d 76 00             	lea    0x0(%esi),%esi
80105039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105040 <sys_open>:

int
sys_open(void)
{
80105040:	55                   	push   %ebp
80105041:	89 e5                	mov    %esp,%ebp
80105043:	57                   	push   %edi
80105044:	56                   	push   %esi
80105045:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105046:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
80105049:	83 ec 24             	sub    $0x24,%esp
  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
8010504c:	50                   	push   %eax
8010504d:	6a 00                	push   $0x0
8010504f:	e8 3c f8 ff ff       	call   80104890 <argstr>
80105054:	83 c4 10             	add    $0x10,%esp
80105057:	85 c0                	test   %eax,%eax
80105059:	0f 88 1d 01 00 00    	js     8010517c <sys_open+0x13c>
8010505f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105062:	83 ec 08             	sub    $0x8,%esp
80105065:	50                   	push   %eax
80105066:	6a 01                	push   $0x1
80105068:	e8 73 f7 ff ff       	call   801047e0 <argint>
8010506d:	83 c4 10             	add    $0x10,%esp
80105070:	85 c0                	test   %eax,%eax
80105072:	0f 88 04 01 00 00    	js     8010517c <sys_open+0x13c>
    return -1;

  begin_op();
80105078:	e8 33 db ff ff       	call   80102bb0 <begin_op>

  if(omode & O_CREATE){
8010507d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105081:	0f 85 a9 00 00 00    	jne    80105130 <sys_open+0xf0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
80105087:	83 ec 0c             	sub    $0xc,%esp
8010508a:	ff 75 e0             	pushl  -0x20(%ebp)
8010508d:	e8 5e ce ff ff       	call   80101ef0 <namei>
80105092:	83 c4 10             	add    $0x10,%esp
80105095:	85 c0                	test   %eax,%eax
80105097:	89 c6                	mov    %eax,%esi
80105099:	0f 84 b2 00 00 00    	je     80105151 <sys_open+0x111>
      end_op();
      return -1;
    }
    ilock(ip);
8010509f:	83 ec 0c             	sub    $0xc,%esp
801050a2:	50                   	push   %eax
801050a3:	e8 e8 c5 ff ff       	call   80101690 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
801050a8:	83 c4 10             	add    $0x10,%esp
801050ab:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
801050b0:	0f 84 aa 00 00 00    	je     80105160 <sys_open+0x120>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
801050b6:	e8 c5 bc ff ff       	call   80100d80 <filealloc>
801050bb:	85 c0                	test   %eax,%eax
801050bd:	89 c7                	mov    %eax,%edi
801050bf:	0f 84 a6 00 00 00    	je     8010516b <sys_open+0x12b>
  struct proc *curproc = myproc();
801050c5:	e8 86 e7 ff ff       	call   80103850 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
801050ca:	31 db                	xor    %ebx,%ebx
801050cc:	eb 0e                	jmp    801050dc <sys_open+0x9c>
801050ce:	66 90                	xchg   %ax,%ax
801050d0:	83 c3 01             	add    $0x1,%ebx
801050d3:	83 fb 10             	cmp    $0x10,%ebx
801050d6:	0f 84 ac 00 00 00    	je     80105188 <sys_open+0x148>
    if(curproc->ofile[fd] == 0){
801050dc:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
801050e0:	85 d2                	test   %edx,%edx
801050e2:	75 ec                	jne    801050d0 <sys_open+0x90>
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801050e4:	83 ec 0c             	sub    $0xc,%esp
      curproc->ofile[fd] = f;
801050e7:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
  iunlock(ip);
801050eb:	56                   	push   %esi
801050ec:	e8 7f c6 ff ff       	call   80101770 <iunlock>
  end_op();
801050f1:	e8 2a db ff ff       	call   80102c20 <end_op>

  f->type = FD_INODE;
801050f6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
801050fc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801050ff:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
80105102:	89 77 10             	mov    %esi,0x10(%edi)
  f->off = 0;
80105105:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
  f->readable = !(omode & O_WRONLY);
8010510c:	89 d0                	mov    %edx,%eax
8010510e:	f7 d0                	not    %eax
80105110:	83 e0 01             	and    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105113:	83 e2 03             	and    $0x3,%edx
  f->readable = !(omode & O_WRONLY);
80105116:	88 47 08             	mov    %al,0x8(%edi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105119:	0f 95 47 09          	setne  0x9(%edi)
  return fd;
}
8010511d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105120:	89 d8                	mov    %ebx,%eax
80105122:	5b                   	pop    %ebx
80105123:	5e                   	pop    %esi
80105124:	5f                   	pop    %edi
80105125:	5d                   	pop    %ebp
80105126:	c3                   	ret    
80105127:	89 f6                	mov    %esi,%esi
80105129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    ip = create(path, T_FILE, 0, 0);
80105130:	83 ec 0c             	sub    $0xc,%esp
80105133:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105136:	31 c9                	xor    %ecx,%ecx
80105138:	6a 00                	push   $0x0
8010513a:	ba 02 00 00 00       	mov    $0x2,%edx
8010513f:	e8 ec f7 ff ff       	call   80104930 <create>
    if(ip == 0){
80105144:	83 c4 10             	add    $0x10,%esp
80105147:	85 c0                	test   %eax,%eax
    ip = create(path, T_FILE, 0, 0);
80105149:	89 c6                	mov    %eax,%esi
    if(ip == 0){
8010514b:	0f 85 65 ff ff ff    	jne    801050b6 <sys_open+0x76>
      end_op();
80105151:	e8 ca da ff ff       	call   80102c20 <end_op>
      return -1;
80105156:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010515b:	eb c0                	jmp    8010511d <sys_open+0xdd>
8010515d:	8d 76 00             	lea    0x0(%esi),%esi
    if(ip->type == T_DIR && omode != O_RDONLY){
80105160:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80105163:	85 c9                	test   %ecx,%ecx
80105165:	0f 84 4b ff ff ff    	je     801050b6 <sys_open+0x76>
    iunlockput(ip);
8010516b:	83 ec 0c             	sub    $0xc,%esp
8010516e:	56                   	push   %esi
8010516f:	e8 ac c7 ff ff       	call   80101920 <iunlockput>
    end_op();
80105174:	e8 a7 da ff ff       	call   80102c20 <end_op>
    return -1;
80105179:	83 c4 10             	add    $0x10,%esp
8010517c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105181:	eb 9a                	jmp    8010511d <sys_open+0xdd>
80105183:	90                   	nop
80105184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      fileclose(f);
80105188:	83 ec 0c             	sub    $0xc,%esp
8010518b:	57                   	push   %edi
8010518c:	e8 af bc ff ff       	call   80100e40 <fileclose>
80105191:	83 c4 10             	add    $0x10,%esp
80105194:	eb d5                	jmp    8010516b <sys_open+0x12b>
80105196:	8d 76 00             	lea    0x0(%esi),%esi
80105199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801051a0 <sys_mkdir>:

int
sys_mkdir(void)
{
801051a0:	55                   	push   %ebp
801051a1:	89 e5                	mov    %esp,%ebp
801051a3:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
801051a6:	e8 05 da ff ff       	call   80102bb0 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
801051ab:	8d 45 f4             	lea    -0xc(%ebp),%eax
801051ae:	83 ec 08             	sub    $0x8,%esp
801051b1:	50                   	push   %eax
801051b2:	6a 00                	push   $0x0
801051b4:	e8 d7 f6 ff ff       	call   80104890 <argstr>
801051b9:	83 c4 10             	add    $0x10,%esp
801051bc:	85 c0                	test   %eax,%eax
801051be:	78 30                	js     801051f0 <sys_mkdir+0x50>
801051c0:	83 ec 0c             	sub    $0xc,%esp
801051c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801051c6:	31 c9                	xor    %ecx,%ecx
801051c8:	6a 00                	push   $0x0
801051ca:	ba 01 00 00 00       	mov    $0x1,%edx
801051cf:	e8 5c f7 ff ff       	call   80104930 <create>
801051d4:	83 c4 10             	add    $0x10,%esp
801051d7:	85 c0                	test   %eax,%eax
801051d9:	74 15                	je     801051f0 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
801051db:	83 ec 0c             	sub    $0xc,%esp
801051de:	50                   	push   %eax
801051df:	e8 3c c7 ff ff       	call   80101920 <iunlockput>
  end_op();
801051e4:	e8 37 da ff ff       	call   80102c20 <end_op>
  return 0;
801051e9:	83 c4 10             	add    $0x10,%esp
801051ec:	31 c0                	xor    %eax,%eax
}
801051ee:	c9                   	leave  
801051ef:	c3                   	ret    
    end_op();
801051f0:	e8 2b da ff ff       	call   80102c20 <end_op>
    return -1;
801051f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801051fa:	c9                   	leave  
801051fb:	c3                   	ret    
801051fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105200 <sys_mknod>:

int
sys_mknod(void)
{
80105200:	55                   	push   %ebp
80105201:	89 e5                	mov    %esp,%ebp
80105203:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
80105206:	e8 a5 d9 ff ff       	call   80102bb0 <begin_op>
  if((argstr(0, &path)) < 0 ||
8010520b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010520e:	83 ec 08             	sub    $0x8,%esp
80105211:	50                   	push   %eax
80105212:	6a 00                	push   $0x0
80105214:	e8 77 f6 ff ff       	call   80104890 <argstr>
80105219:	83 c4 10             	add    $0x10,%esp
8010521c:	85 c0                	test   %eax,%eax
8010521e:	78 60                	js     80105280 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
80105220:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105223:	83 ec 08             	sub    $0x8,%esp
80105226:	50                   	push   %eax
80105227:	6a 01                	push   $0x1
80105229:	e8 b2 f5 ff ff       	call   801047e0 <argint>
  if((argstr(0, &path)) < 0 ||
8010522e:	83 c4 10             	add    $0x10,%esp
80105231:	85 c0                	test   %eax,%eax
80105233:	78 4b                	js     80105280 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
80105235:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105238:	83 ec 08             	sub    $0x8,%esp
8010523b:	50                   	push   %eax
8010523c:	6a 02                	push   $0x2
8010523e:	e8 9d f5 ff ff       	call   801047e0 <argint>
     argint(1, &major) < 0 ||
80105243:	83 c4 10             	add    $0x10,%esp
80105246:	85 c0                	test   %eax,%eax
80105248:	78 36                	js     80105280 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
8010524a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
     argint(2, &minor) < 0 ||
8010524e:	83 ec 0c             	sub    $0xc,%esp
     (ip = create(path, T_DEV, major, minor)) == 0){
80105251:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
     argint(2, &minor) < 0 ||
80105255:	ba 03 00 00 00       	mov    $0x3,%edx
8010525a:	50                   	push   %eax
8010525b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010525e:	e8 cd f6 ff ff       	call   80104930 <create>
80105263:	83 c4 10             	add    $0x10,%esp
80105266:	85 c0                	test   %eax,%eax
80105268:	74 16                	je     80105280 <sys_mknod+0x80>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010526a:	83 ec 0c             	sub    $0xc,%esp
8010526d:	50                   	push   %eax
8010526e:	e8 ad c6 ff ff       	call   80101920 <iunlockput>
  end_op();
80105273:	e8 a8 d9 ff ff       	call   80102c20 <end_op>
  return 0;
80105278:	83 c4 10             	add    $0x10,%esp
8010527b:	31 c0                	xor    %eax,%eax
}
8010527d:	c9                   	leave  
8010527e:	c3                   	ret    
8010527f:	90                   	nop
    end_op();
80105280:	e8 9b d9 ff ff       	call   80102c20 <end_op>
    return -1;
80105285:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010528a:	c9                   	leave  
8010528b:	c3                   	ret    
8010528c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105290 <sys_chdir>:

int
sys_chdir(void)
{
80105290:	55                   	push   %ebp
80105291:	89 e5                	mov    %esp,%ebp
80105293:	56                   	push   %esi
80105294:	53                   	push   %ebx
80105295:	83 ec 10             	sub    $0x10,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
80105298:	e8 b3 e5 ff ff       	call   80103850 <myproc>
8010529d:	89 c6                	mov    %eax,%esi
  
  begin_op();
8010529f:	e8 0c d9 ff ff       	call   80102bb0 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
801052a4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801052a7:	83 ec 08             	sub    $0x8,%esp
801052aa:	50                   	push   %eax
801052ab:	6a 00                	push   $0x0
801052ad:	e8 de f5 ff ff       	call   80104890 <argstr>
801052b2:	83 c4 10             	add    $0x10,%esp
801052b5:	85 c0                	test   %eax,%eax
801052b7:	78 77                	js     80105330 <sys_chdir+0xa0>
801052b9:	83 ec 0c             	sub    $0xc,%esp
801052bc:	ff 75 f4             	pushl  -0xc(%ebp)
801052bf:	e8 2c cc ff ff       	call   80101ef0 <namei>
801052c4:	83 c4 10             	add    $0x10,%esp
801052c7:	85 c0                	test   %eax,%eax
801052c9:	89 c3                	mov    %eax,%ebx
801052cb:	74 63                	je     80105330 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
801052cd:	83 ec 0c             	sub    $0xc,%esp
801052d0:	50                   	push   %eax
801052d1:	e8 ba c3 ff ff       	call   80101690 <ilock>
  if(ip->type != T_DIR){
801052d6:	83 c4 10             	add    $0x10,%esp
801052d9:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801052de:	75 30                	jne    80105310 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801052e0:	83 ec 0c             	sub    $0xc,%esp
801052e3:	53                   	push   %ebx
801052e4:	e8 87 c4 ff ff       	call   80101770 <iunlock>
  iput(curproc->cwd);
801052e9:	58                   	pop    %eax
801052ea:	ff 76 68             	pushl  0x68(%esi)
801052ed:	e8 ce c4 ff ff       	call   801017c0 <iput>
  end_op();
801052f2:	e8 29 d9 ff ff       	call   80102c20 <end_op>
  curproc->cwd = ip;
801052f7:	89 5e 68             	mov    %ebx,0x68(%esi)
  return 0;
801052fa:	83 c4 10             	add    $0x10,%esp
801052fd:	31 c0                	xor    %eax,%eax
}
801052ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105302:	5b                   	pop    %ebx
80105303:	5e                   	pop    %esi
80105304:	5d                   	pop    %ebp
80105305:	c3                   	ret    
80105306:	8d 76 00             	lea    0x0(%esi),%esi
80105309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    iunlockput(ip);
80105310:	83 ec 0c             	sub    $0xc,%esp
80105313:	53                   	push   %ebx
80105314:	e8 07 c6 ff ff       	call   80101920 <iunlockput>
    end_op();
80105319:	e8 02 d9 ff ff       	call   80102c20 <end_op>
    return -1;
8010531e:	83 c4 10             	add    $0x10,%esp
80105321:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105326:	eb d7                	jmp    801052ff <sys_chdir+0x6f>
80105328:	90                   	nop
80105329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    end_op();
80105330:	e8 eb d8 ff ff       	call   80102c20 <end_op>
    return -1;
80105335:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010533a:	eb c3                	jmp    801052ff <sys_chdir+0x6f>
8010533c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105340 <sys_exec>:

int
sys_exec(void)
{
80105340:	55                   	push   %ebp
80105341:	89 e5                	mov    %esp,%ebp
80105343:	57                   	push   %edi
80105344:	56                   	push   %esi
80105345:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105346:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
{
8010534c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105352:	50                   	push   %eax
80105353:	6a 00                	push   $0x0
80105355:	e8 36 f5 ff ff       	call   80104890 <argstr>
8010535a:	83 c4 10             	add    $0x10,%esp
8010535d:	85 c0                	test   %eax,%eax
8010535f:	0f 88 87 00 00 00    	js     801053ec <sys_exec+0xac>
80105365:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
8010536b:	83 ec 08             	sub    $0x8,%esp
8010536e:	50                   	push   %eax
8010536f:	6a 01                	push   $0x1
80105371:	e8 6a f4 ff ff       	call   801047e0 <argint>
80105376:	83 c4 10             	add    $0x10,%esp
80105379:	85 c0                	test   %eax,%eax
8010537b:	78 6f                	js     801053ec <sys_exec+0xac>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
8010537d:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105383:	83 ec 04             	sub    $0x4,%esp
  for(i=0;; i++){
80105386:	31 db                	xor    %ebx,%ebx
  memset(argv, 0, sizeof(argv));
80105388:	68 80 00 00 00       	push   $0x80
8010538d:	6a 00                	push   $0x0
8010538f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105395:	50                   	push   %eax
80105396:	e8 45 f1 ff ff       	call   801044e0 <memset>
8010539b:	83 c4 10             	add    $0x10,%esp
8010539e:	eb 2c                	jmp    801053cc <sys_exec+0x8c>
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
801053a0:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
801053a6:	85 c0                	test   %eax,%eax
801053a8:	74 56                	je     80105400 <sys_exec+0xc0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
801053aa:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
801053b0:	83 ec 08             	sub    $0x8,%esp
801053b3:	8d 14 31             	lea    (%ecx,%esi,1),%edx
801053b6:	52                   	push   %edx
801053b7:	50                   	push   %eax
801053b8:	e8 b3 f3 ff ff       	call   80104770 <fetchstr>
801053bd:	83 c4 10             	add    $0x10,%esp
801053c0:	85 c0                	test   %eax,%eax
801053c2:	78 28                	js     801053ec <sys_exec+0xac>
  for(i=0;; i++){
801053c4:	83 c3 01             	add    $0x1,%ebx
    if(i >= NELEM(argv))
801053c7:	83 fb 20             	cmp    $0x20,%ebx
801053ca:	74 20                	je     801053ec <sys_exec+0xac>
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
801053cc:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
801053d2:	8d 34 9d 00 00 00 00 	lea    0x0(,%ebx,4),%esi
801053d9:	83 ec 08             	sub    $0x8,%esp
801053dc:	57                   	push   %edi
801053dd:	01 f0                	add    %esi,%eax
801053df:	50                   	push   %eax
801053e0:	e8 4b f3 ff ff       	call   80104730 <fetchint>
801053e5:	83 c4 10             	add    $0x10,%esp
801053e8:	85 c0                	test   %eax,%eax
801053ea:	79 b4                	jns    801053a0 <sys_exec+0x60>
      return -1;
  }
  return exec(path, argv);
}
801053ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
801053ef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801053f4:	5b                   	pop    %ebx
801053f5:	5e                   	pop    %esi
801053f6:	5f                   	pop    %edi
801053f7:	5d                   	pop    %ebp
801053f8:	c3                   	ret    
801053f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return exec(path, argv);
80105400:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105406:	83 ec 08             	sub    $0x8,%esp
      argv[i] = 0;
80105409:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105410:	00 00 00 00 
  return exec(path, argv);
80105414:	50                   	push   %eax
80105415:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010541b:	e8 f0 b5 ff ff       	call   80100a10 <exec>
80105420:	83 c4 10             	add    $0x10,%esp
}
80105423:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105426:	5b                   	pop    %ebx
80105427:	5e                   	pop    %esi
80105428:	5f                   	pop    %edi
80105429:	5d                   	pop    %ebp
8010542a:	c3                   	ret    
8010542b:	90                   	nop
8010542c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105430 <sys_pipe>:

int
sys_pipe(void)
{
80105430:	55                   	push   %ebp
80105431:	89 e5                	mov    %esp,%ebp
80105433:	57                   	push   %edi
80105434:	56                   	push   %esi
80105435:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80105436:	8d 45 dc             	lea    -0x24(%ebp),%eax
{
80105439:	83 ec 20             	sub    $0x20,%esp
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
8010543c:	6a 08                	push   $0x8
8010543e:	50                   	push   %eax
8010543f:	6a 00                	push   $0x0
80105441:	e8 ea f3 ff ff       	call   80104830 <argptr>
80105446:	83 c4 10             	add    $0x10,%esp
80105449:	85 c0                	test   %eax,%eax
8010544b:	0f 88 ae 00 00 00    	js     801054ff <sys_pipe+0xcf>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
80105451:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105454:	83 ec 08             	sub    $0x8,%esp
80105457:	50                   	push   %eax
80105458:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010545b:	50                   	push   %eax
8010545c:	e8 ef dd ff ff       	call   80103250 <pipealloc>
80105461:	83 c4 10             	add    $0x10,%esp
80105464:	85 c0                	test   %eax,%eax
80105466:	0f 88 93 00 00 00    	js     801054ff <sys_pipe+0xcf>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
8010546c:	8b 7d e0             	mov    -0x20(%ebp),%edi
  for(fd = 0; fd < NOFILE; fd++){
8010546f:	31 db                	xor    %ebx,%ebx
  struct proc *curproc = myproc();
80105471:	e8 da e3 ff ff       	call   80103850 <myproc>
80105476:	eb 10                	jmp    80105488 <sys_pipe+0x58>
80105478:	90                   	nop
80105479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(fd = 0; fd < NOFILE; fd++){
80105480:	83 c3 01             	add    $0x1,%ebx
80105483:	83 fb 10             	cmp    $0x10,%ebx
80105486:	74 60                	je     801054e8 <sys_pipe+0xb8>
    if(curproc->ofile[fd] == 0){
80105488:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
8010548c:	85 f6                	test   %esi,%esi
8010548e:	75 f0                	jne    80105480 <sys_pipe+0x50>
      curproc->ofile[fd] = f;
80105490:	8d 73 08             	lea    0x8(%ebx),%esi
80105493:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105497:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  struct proc *curproc = myproc();
8010549a:	e8 b1 e3 ff ff       	call   80103850 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
8010549f:	31 d2                	xor    %edx,%edx
801054a1:	eb 0d                	jmp    801054b0 <sys_pipe+0x80>
801054a3:	90                   	nop
801054a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801054a8:	83 c2 01             	add    $0x1,%edx
801054ab:	83 fa 10             	cmp    $0x10,%edx
801054ae:	74 28                	je     801054d8 <sys_pipe+0xa8>
    if(curproc->ofile[fd] == 0){
801054b0:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
801054b4:	85 c9                	test   %ecx,%ecx
801054b6:	75 f0                	jne    801054a8 <sys_pipe+0x78>
      curproc->ofile[fd] = f;
801054b8:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
801054bc:	8b 45 dc             	mov    -0x24(%ebp),%eax
801054bf:	89 18                	mov    %ebx,(%eax)
  fd[1] = fd1;
801054c1:	8b 45 dc             	mov    -0x24(%ebp),%eax
801054c4:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
801054c7:	31 c0                	xor    %eax,%eax
}
801054c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801054cc:	5b                   	pop    %ebx
801054cd:	5e                   	pop    %esi
801054ce:	5f                   	pop    %edi
801054cf:	5d                   	pop    %ebp
801054d0:	c3                   	ret    
801054d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      myproc()->ofile[fd0] = 0;
801054d8:	e8 73 e3 ff ff       	call   80103850 <myproc>
801054dd:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
801054e4:	00 
801054e5:	8d 76 00             	lea    0x0(%esi),%esi
    fileclose(rf);
801054e8:	83 ec 0c             	sub    $0xc,%esp
801054eb:	ff 75 e0             	pushl  -0x20(%ebp)
801054ee:	e8 4d b9 ff ff       	call   80100e40 <fileclose>
    fileclose(wf);
801054f3:	58                   	pop    %eax
801054f4:	ff 75 e4             	pushl  -0x1c(%ebp)
801054f7:	e8 44 b9 ff ff       	call   80100e40 <fileclose>
    return -1;
801054fc:	83 c4 10             	add    $0x10,%esp
801054ff:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105504:	eb c3                	jmp    801054c9 <sys_pipe+0x99>
80105506:	66 90                	xchg   %ax,%ax
80105508:	66 90                	xchg   %ax,%ax
8010550a:	66 90                	xchg   %ax,%ax
8010550c:	66 90                	xchg   %ax,%ax
8010550e:	66 90                	xchg   %ax,%ax

80105510 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
80105510:	55                   	push   %ebp
80105511:	89 e5                	mov    %esp,%ebp
	return fork();
}
80105513:	5d                   	pop    %ebp
	return fork();
80105514:	e9 d7 e4 ff ff       	jmp    801039f0 <fork>
80105519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105520 <sys_exit>:

int
sys_exit(void)
{
80105520:	55                   	push   %ebp
80105521:	89 e5                	mov    %esp,%ebp
80105523:	83 ec 08             	sub    $0x8,%esp
  exit();
80105526:	e8 45 e7 ff ff       	call   80103c70 <exit>
  return 0;  // not reached
}
8010552b:	31 c0                	xor    %eax,%eax
8010552d:	c9                   	leave  
8010552e:	c3                   	ret    
8010552f:	90                   	nop

80105530 <sys_wait>:

int
sys_wait(void)
{
80105530:	55                   	push   %ebp
80105531:	89 e5                	mov    %esp,%ebp
  return wait();
}
80105533:	5d                   	pop    %ebp
  return wait();
80105534:	e9 77 e9 ff ff       	jmp    80103eb0 <wait>
80105539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105540 <sys_kill>:

int
sys_kill(void)
{
80105540:	55                   	push   %ebp
80105541:	89 e5                	mov    %esp,%ebp
80105543:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105546:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105549:	50                   	push   %eax
8010554a:	6a 00                	push   $0x0
8010554c:	e8 8f f2 ff ff       	call   801047e0 <argint>
80105551:	83 c4 10             	add    $0x10,%esp
80105554:	85 c0                	test   %eax,%eax
80105556:	78 18                	js     80105570 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105558:	83 ec 0c             	sub    $0xc,%esp
8010555b:	ff 75 f4             	pushl  -0xc(%ebp)
8010555e:	e8 ad ea ff ff       	call   80104010 <kill>
80105563:	83 c4 10             	add    $0x10,%esp
}
80105566:	c9                   	leave  
80105567:	c3                   	ret    
80105568:	90                   	nop
80105569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105570:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105575:	c9                   	leave  
80105576:	c3                   	ret    
80105577:	89 f6                	mov    %esi,%esi
80105579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105580 <sys_getpid>:

int
sys_getpid(void)
{
80105580:	55                   	push   %ebp
80105581:	89 e5                	mov    %esp,%ebp
80105583:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
80105586:	e8 c5 e2 ff ff       	call   80103850 <myproc>
8010558b:	8b 40 10             	mov    0x10(%eax),%eax
}
8010558e:	c9                   	leave  
8010558f:	c3                   	ret    

80105590 <sys_sbrk>:

int
sys_sbrk(void)
{
80105590:	55                   	push   %ebp
80105591:	89 e5                	mov    %esp,%ebp
80105593:	56                   	push   %esi
80105594:	53                   	push   %ebx
  int addr;
  int n;
	uint sz;

  if(argint(0, &n) < 0)
80105595:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
80105598:	83 ec 18             	sub    $0x18,%esp
  if(argint(0, &n) < 0)
8010559b:	50                   	push   %eax
8010559c:	6a 00                	push   $0x0
8010559e:	e8 3d f2 ff ff       	call   801047e0 <argint>
801055a3:	83 c4 10             	add    $0x10,%esp
801055a6:	85 c0                	test   %eax,%eax
801055a8:	78 46                	js     801055f0 <sys_sbrk+0x60>
    return -1;
	
	addr = myproc()->sz;
801055aa:	e8 a1 e2 ff ff       	call   80103850 <myproc>
	myproc()->sz = addr+n;
801055af:	8b 75 f4             	mov    -0xc(%ebp),%esi
	addr = myproc()->sz;
801055b2:	8b 18                	mov    (%eax),%ebx
	myproc()->sz = addr+n;
801055b4:	e8 97 e2 ff ff       	call   80103850 <myproc>
801055b9:	01 de                	add    %ebx,%esi
801055bb:	89 30                	mov    %esi,(%eax)

	if(n < 0) {
801055bd:	8b 75 f4             	mov    -0xc(%ebp),%esi
801055c0:	85 f6                	test   %esi,%esi
801055c2:	78 0c                	js     801055d0 <sys_sbrk+0x40>
		if((sz = deallocuvm(myproc()->pgdir, addr, addr + n)) == 0) 
			return -1;
	}
	
	return addr;
}
801055c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801055c7:	89 d8                	mov    %ebx,%eax
801055c9:	5b                   	pop    %ebx
801055ca:	5e                   	pop    %esi
801055cb:	5d                   	pop    %ebp
801055cc:	c3                   	ret    
801055cd:	8d 76 00             	lea    0x0(%esi),%esi
		if((sz = deallocuvm(myproc()->pgdir, addr, addr + n)) == 0) 
801055d0:	e8 7b e2 ff ff       	call   80103850 <myproc>
801055d5:	01 de                	add    %ebx,%esi
801055d7:	83 ec 04             	sub    $0x4,%esp
801055da:	56                   	push   %esi
801055db:	53                   	push   %ebx
801055dc:	ff 70 04             	pushl  0x4(%eax)
801055df:	e8 ac 19 00 00       	call   80106f90 <deallocuvm>
801055e4:	83 c4 10             	add    $0x10,%esp
801055e7:	85 c0                	test   %eax,%eax
801055e9:	75 d9                	jne    801055c4 <sys_sbrk+0x34>
801055eb:	90                   	nop
801055ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
801055f0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801055f5:	eb cd                	jmp    801055c4 <sys_sbrk+0x34>
801055f7:	89 f6                	mov    %esi,%esi
801055f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105600 <sys_sleep>:

int
sys_sleep(void)
{
80105600:	55                   	push   %ebp
80105601:	89 e5                	mov    %esp,%ebp
80105603:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105604:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
80105607:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
8010560a:	50                   	push   %eax
8010560b:	6a 00                	push   $0x0
8010560d:	e8 ce f1 ff ff       	call   801047e0 <argint>
80105612:	83 c4 10             	add    $0x10,%esp
80105615:	85 c0                	test   %eax,%eax
80105617:	0f 88 8a 00 00 00    	js     801056a7 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
8010561d:	83 ec 0c             	sub    $0xc,%esp
80105620:	68 60 55 11 80       	push   $0x80115560
80105625:	e8 a6 ed ff ff       	call   801043d0 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
8010562a:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010562d:	83 c4 10             	add    $0x10,%esp
  ticks0 = ticks;
80105630:	8b 1d a0 5d 11 80    	mov    0x80115da0,%ebx
  while(ticks - ticks0 < n){
80105636:	85 d2                	test   %edx,%edx
80105638:	75 27                	jne    80105661 <sys_sleep+0x61>
8010563a:	eb 54                	jmp    80105690 <sys_sleep+0x90>
8010563c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105640:	83 ec 08             	sub    $0x8,%esp
80105643:	68 60 55 11 80       	push   $0x80115560
80105648:	68 a0 5d 11 80       	push   $0x80115da0
8010564d:	e8 9e e7 ff ff       	call   80103df0 <sleep>
  while(ticks - ticks0 < n){
80105652:	a1 a0 5d 11 80       	mov    0x80115da0,%eax
80105657:	83 c4 10             	add    $0x10,%esp
8010565a:	29 d8                	sub    %ebx,%eax
8010565c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010565f:	73 2f                	jae    80105690 <sys_sleep+0x90>
    if(myproc()->killed){
80105661:	e8 ea e1 ff ff       	call   80103850 <myproc>
80105666:	8b 40 24             	mov    0x24(%eax),%eax
80105669:	85 c0                	test   %eax,%eax
8010566b:	74 d3                	je     80105640 <sys_sleep+0x40>
      release(&tickslock);
8010566d:	83 ec 0c             	sub    $0xc,%esp
80105670:	68 60 55 11 80       	push   $0x80115560
80105675:	e8 16 ee ff ff       	call   80104490 <release>
      return -1;
8010567a:	83 c4 10             	add    $0x10,%esp
8010567d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&tickslock);
  return 0;
}
80105682:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105685:	c9                   	leave  
80105686:	c3                   	ret    
80105687:	89 f6                	mov    %esi,%esi
80105689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  release(&tickslock);
80105690:	83 ec 0c             	sub    $0xc,%esp
80105693:	68 60 55 11 80       	push   $0x80115560
80105698:	e8 f3 ed ff ff       	call   80104490 <release>
  return 0;
8010569d:	83 c4 10             	add    $0x10,%esp
801056a0:	31 c0                	xor    %eax,%eax
}
801056a2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801056a5:	c9                   	leave  
801056a6:	c3                   	ret    
    return -1;
801056a7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801056ac:	eb f4                	jmp    801056a2 <sys_sleep+0xa2>
801056ae:	66 90                	xchg   %ax,%ax

801056b0 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
801056b0:	55                   	push   %ebp
801056b1:	89 e5                	mov    %esp,%ebp
801056b3:	53                   	push   %ebx
801056b4:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
801056b7:	68 60 55 11 80       	push   $0x80115560
801056bc:	e8 0f ed ff ff       	call   801043d0 <acquire>
  xticks = ticks;
801056c1:	8b 1d a0 5d 11 80    	mov    0x80115da0,%ebx
  release(&tickslock);
801056c7:	c7 04 24 60 55 11 80 	movl   $0x80115560,(%esp)
801056ce:	e8 bd ed ff ff       	call   80104490 <release>
  return xticks;
}
801056d3:	89 d8                	mov    %ebx,%eax
801056d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801056d8:	c9                   	leave  
801056d9:	c3                   	ret    
801056da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801056e0 <sys_date>:

int
sys_date(void)
{
801056e0:	55                   	push   %ebp
801056e1:	89 e5                	mov    %esp,%ebp
801056e3:	83 ec 1c             	sub    $0x1c,%esp
	struct rtcdate *r;

	if(argptr(0, (void*)&r, sizeof(*r)) < 0) {
801056e6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801056e9:	6a 18                	push   $0x18
801056eb:	50                   	push   %eax
801056ec:	6a 00                	push   $0x0
801056ee:	e8 3d f1 ff ff       	call   80104830 <argptr>
801056f3:	83 c4 10             	add    $0x10,%esp
801056f6:	85 c0                	test   %eax,%eax
801056f8:	78 16                	js     80105710 <sys_date+0x30>
		return -1;
	}
	cmostime(r);
801056fa:	83 ec 0c             	sub    $0xc,%esp
801056fd:	ff 75 f4             	pushl  -0xc(%ebp)
80105700:	e8 1b d1 ff ff       	call   80102820 <cmostime>
	return 0;
80105705:	83 c4 10             	add    $0x10,%esp
80105708:	31 c0                	xor    %eax,%eax
}
8010570a:	c9                   	leave  
8010570b:	c3                   	ret    
8010570c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		return -1;
80105710:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105715:	c9                   	leave  
80105716:	c3                   	ret    
80105717:	89 f6                	mov    %esi,%esi
80105719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105720 <sys_alarm>:
// xv6 cpu alarm
// if ticks > 0, every n ticks alarm process
// if ticks == -1, turn off alarm
int
sys_alarm(void)
{
80105720:	55                   	push   %ebp
80105721:	89 e5                	mov    %esp,%ebp
80105723:	53                   	push   %ebx
  int ticks;
  void (*handler)();

  if(argint(0, &ticks) < 0)
80105724:	8d 45 f0             	lea    -0x10(%ebp),%eax
{
80105727:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &ticks) < 0)
8010572a:	50                   	push   %eax
8010572b:	6a 00                	push   $0x0
8010572d:	e8 ae f0 ff ff       	call   801047e0 <argint>
80105732:	83 c4 10             	add    $0x10,%esp
80105735:	85 c0                	test   %eax,%eax
80105737:	0f 88 83 00 00 00    	js     801057c0 <sys_alarm+0xa0>
    return -1;
  if(argptr(1, (char**)&handler, 1) < 0)
8010573d:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105740:	83 ec 04             	sub    $0x4,%esp
80105743:	6a 01                	push   $0x1
80105745:	50                   	push   %eax
80105746:	6a 01                	push   $0x1
80105748:	e8 e3 f0 ff ff       	call   80104830 <argptr>
8010574d:	83 c4 10             	add    $0x10,%esp
80105750:	85 c0                	test   %eax,%eax
80105752:	78 6c                	js     801057c0 <sys_alarm+0xa0>
    return -1;
  
  if(ticks < -1 || ticks == 0) return -1;
80105754:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105757:	83 f8 ff             	cmp    $0xffffffff,%eax
8010575a:	7c 64                	jl     801057c0 <sys_alarm+0xa0>
8010575c:	85 c0                	test   %eax,%eax
8010575e:	74 60                	je     801057c0 <sys_alarm+0xa0>
  if(handler == 0) return -1;
80105760:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105763:	85 d2                	test   %edx,%edx
80105765:	74 59                	je     801057c0 <sys_alarm+0xa0>
  
  if(ticks == -1) {
80105767:	83 f8 ff             	cmp    $0xffffffff,%eax
8010576a:	74 34                	je     801057a0 <sys_alarm+0x80>
    myproc()->alarmstate = 0;
  } else {
    myproc()->alarmticks = ticks;
8010576c:	e8 df e0 ff ff       	call   80103850 <myproc>
80105771:	8b 55 f0             	mov    -0x10(%ebp),%edx
    myproc()->alarmhandler = (uint)handler;
80105774:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    myproc()->alarmticks = ticks;
80105777:	89 50 7c             	mov    %edx,0x7c(%eax)
    myproc()->alarmhandler = (uint)handler;
8010577a:	e8 d1 e0 ff ff       	call   80103850 <myproc>
8010577f:	89 98 84 00 00 00    	mov    %ebx,0x84(%eax)
    myproc()->alarmstate = 1;
80105785:	e8 c6 e0 ff ff       	call   80103850 <myproc>
8010578a:	c7 80 90 00 00 00 01 	movl   $0x1,0x90(%eax)
80105791:	00 00 00 
  }
  
  return 0;
80105794:	31 c0                	xor    %eax,%eax
}
80105796:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105799:	c9                   	leave  
8010579a:	c3                   	ret    
8010579b:	90                   	nop
8010579c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    myproc()->alarmstate = 0;
801057a0:	e8 ab e0 ff ff       	call   80103850 <myproc>
801057a5:	c7 80 90 00 00 00 00 	movl   $0x0,0x90(%eax)
801057ac:	00 00 00 
  return 0;
801057af:	31 c0                	xor    %eax,%eax
}
801057b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801057b4:	c9                   	leave  
801057b5:	c3                   	ret    
801057b6:	8d 76 00             	lea    0x0(%esi),%esi
801057b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
801057c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801057c5:	eb cf                	jmp    80105796 <sys_alarm+0x76>

801057c7 <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
801057c7:	1e                   	push   %ds
  pushl %es
801057c8:	06                   	push   %es
  pushl %fs
801057c9:	0f a0                	push   %fs
  pushl %gs
801057cb:	0f a8                	push   %gs
  pushal
801057cd:	60                   	pusha  
  
  # Set up data segments.
  movw $(SEG_KDATA<<3), %ax
801057ce:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
801057d2:	8e d8                	mov    %eax,%ds
  movw %ax, %es
801057d4:	8e c0                	mov    %eax,%es

  # Call trap(tf), where tf=%esp
  pushl %esp
801057d6:	54                   	push   %esp
  call trap
801057d7:	e8 c4 00 00 00       	call   801058a0 <trap>
  addl $4, %esp
801057dc:	83 c4 04             	add    $0x4,%esp

801057df <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
801057df:	61                   	popa   
  popl %gs
801057e0:	0f a9                	pop    %gs
  popl %fs
801057e2:	0f a1                	pop    %fs
  popl %es
801057e4:	07                   	pop    %es
  popl %ds
801057e5:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
801057e6:	83 c4 08             	add    $0x8,%esp
  iret
801057e9:	cf                   	iret   
801057ea:	66 90                	xchg   %ax,%ax
801057ec:	66 90                	xchg   %ax,%ax
801057ee:	66 90                	xchg   %ax,%ax

801057f0 <tvinit>:
// lazy page allocation
int mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm);

void
tvinit(void)
{
801057f0:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
801057f1:	31 c0                	xor    %eax,%eax
{
801057f3:	89 e5                	mov    %esp,%ebp
801057f5:	83 ec 08             	sub    $0x8,%esp
801057f8:	90                   	nop
801057f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105800:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
80105807:	c7 04 c5 a2 55 11 80 	movl   $0x8e000008,-0x7feeaa5e(,%eax,8)
8010580e:	08 00 00 8e 
80105812:	66 89 14 c5 a0 55 11 	mov    %dx,-0x7feeaa60(,%eax,8)
80105819:	80 
8010581a:	c1 ea 10             	shr    $0x10,%edx
8010581d:	66 89 14 c5 a6 55 11 	mov    %dx,-0x7feeaa5a(,%eax,8)
80105824:	80 
  for(i = 0; i < 256; i++)
80105825:	83 c0 01             	add    $0x1,%eax
80105828:	3d 00 01 00 00       	cmp    $0x100,%eax
8010582d:	75 d1                	jne    80105800 <tvinit+0x10>
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
8010582f:	a1 08 a1 10 80       	mov    0x8010a108,%eax

  initlock(&tickslock, "time");
80105834:	83 ec 08             	sub    $0x8,%esp
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105837:	c7 05 a2 57 11 80 08 	movl   $0xef000008,0x801157a2
8010583e:	00 00 ef 
  initlock(&tickslock, "time");
80105841:	68 a1 7a 10 80       	push   $0x80107aa1
80105846:	68 60 55 11 80       	push   $0x80115560
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
8010584b:	66 a3 a0 57 11 80    	mov    %ax,0x801157a0
80105851:	c1 e8 10             	shr    $0x10,%eax
80105854:	66 a3 a6 57 11 80    	mov    %ax,0x801157a6
  initlock(&tickslock, "time");
8010585a:	e8 31 ea ff ff       	call   80104290 <initlock>
}
8010585f:	83 c4 10             	add    $0x10,%esp
80105862:	c9                   	leave  
80105863:	c3                   	ret    
80105864:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010586a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105870 <idtinit>:

void
idtinit(void)
{
80105870:	55                   	push   %ebp
  pd[0] = size-1;
80105871:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105876:	89 e5                	mov    %esp,%ebp
80105878:	83 ec 10             	sub    $0x10,%esp
8010587b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
8010587f:	b8 a0 55 11 80       	mov    $0x801155a0,%eax
80105884:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105888:	c1 e8 10             	shr    $0x10,%eax
8010588b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  asm volatile("lidt (%0)" : : "r" (pd));
8010588f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105892:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105895:	c9                   	leave  
80105896:	c3                   	ret    
80105897:	89 f6                	mov    %esi,%esi
80105899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801058a0 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
801058a0:	55                   	push   %ebp
801058a1:	89 e5                	mov    %esp,%ebp
801058a3:	57                   	push   %edi
801058a4:	56                   	push   %esi
801058a5:	53                   	push   %ebx
801058a6:	83 ec 1c             	sub    $0x1c,%esp
801058a9:	8b 7d 08             	mov    0x8(%ebp),%edi
	uint newsz;
	uint a;
	char *mem;
	pde_t *pgdir;

	if(tf->trapno == T_SYSCALL){
801058ac:	8b 47 30             	mov    0x30(%edi),%eax
801058af:	83 f8 40             	cmp    $0x40,%eax
801058b2:	0f 84 30 01 00 00    	je     801059e8 <trap+0x148>
    syscall();
    if(myproc()->killed)
      exit();
    return;
  }
  switch(tf->trapno){
801058b8:	83 e8 0e             	sub    $0xe,%eax
801058bb:	83 f8 31             	cmp    $0x31,%eax
801058be:	0f 87 7c 03 00 00    	ja     80105c40 <trap+0x3a0>
801058c4:	ff 24 85 78 7b 10 80 	jmp    *-0x7fef8488(,%eax,4)
801058cb:	90                   	nop
801058cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		// Lazy Page Allocation
		oldsz = myproc()->sz;
		newsz = rcr2();
		pgdir = myproc()->pgdir;
    
    if(newsz == 0xffffffff && myproc() != 0 && myproc()->alarmstate == 2 && myproc()->validcheck == tf->esp) {
801058d0:	e8 7b df ff ff       	call   80103850 <myproc>
801058d5:	85 c0                	test   %eax,%eax
801058d7:	0f 84 db 03 00 00    	je     80105cb8 <trap+0x418>
801058dd:	e8 6e df ff ff       	call   80103850 <myproc>
801058e2:	83 b8 90 00 00 00 02 	cmpl   $0x2,0x90(%eax)
801058e9:	0f 85 c9 03 00 00    	jne    80105cb8 <trap+0x418>
801058ef:	e8 5c df ff ff       	call   80103850 <myproc>
801058f4:	8b 4f 44             	mov    0x44(%edi),%ecx
801058f7:	39 88 8c 00 00 00    	cmp    %ecx,0x8c(%eax)
801058fd:	0f 85 b5 03 00 00    	jne    80105cb8 <trap+0x418>
      myproc()->alarmstate = 1;
80105903:	e8 48 df ff ff       	call   80103850 <myproc>
80105908:	c7 80 90 00 00 00 01 	movl   $0x1,0x90(%eax)
8010590f:	00 00 00 
      myproc()->ticksby = 0;
80105912:	e8 39 df ff ff       	call   80103850 <myproc>
80105917:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
8010591e:	00 00 00 
      tf->eip = myproc()->resume;
80105921:	e8 2a df ff ff       	call   80103850 <myproc>
80105926:	8b 80 88 00 00 00    	mov    0x88(%eax),%eax
8010592c:	89 47 38             	mov    %eax,0x38(%edi)
      tf->eax = myproc()->eax;
8010592f:	e8 1c df ff ff       	call   80103850 <myproc>
80105934:	8b 80 94 00 00 00    	mov    0x94(%eax),%eax
8010593a:	89 47 1c             	mov    %eax,0x1c(%edi)
      tf->edx = myproc()->edx;
8010593d:	e8 0e df ff ff       	call   80103850 <myproc>
80105942:	8b 80 98 00 00 00    	mov    0x98(%eax),%eax
80105948:	89 47 14             	mov    %eax,0x14(%edi)
      tf->ecx = myproc()->ecx;
8010594b:	e8 00 df ff ff       	call   80103850 <myproc>
80105950:	8b 80 9c 00 00 00    	mov    0x9c(%eax),%eax
80105956:	89 47 18             	mov    %eax,0x18(%edi)
80105959:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            myproc()->pid, myproc()->name, tf->trapno,
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
  }
  // Alarm process
  if(myproc() != 0 && (tf->cs & 3) == 3 && tf->trapno == T_IRQ0+IRQ_TIMER && 
80105960:	e8 eb de ff ff       	call   80103850 <myproc>
80105965:	85 c0                	test   %eax,%eax
80105967:	74 11                	je     8010597a <trap+0xda>
80105969:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
8010596d:	83 e0 03             	and    $0x3,%eax
80105970:	66 83 f8 03          	cmp    $0x3,%ax
80105974:	0f 84 a6 00 00 00    	je     80105a20 <trap+0x180>
  }
  
  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
8010597a:	e8 d1 de ff ff       	call   80103850 <myproc>
8010597f:	85 c0                	test   %eax,%eax
80105981:	74 1d                	je     801059a0 <trap+0x100>
80105983:	e8 c8 de ff ff       	call   80103850 <myproc>
80105988:	8b 50 24             	mov    0x24(%eax),%edx
8010598b:	85 d2                	test   %edx,%edx
8010598d:	74 11                	je     801059a0 <trap+0x100>
8010598f:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105993:	83 e0 03             	and    $0x3,%eax
80105996:	66 83 f8 03          	cmp    $0x3,%ax
8010599a:	0f 84 50 03 00 00    	je     80105cf0 <trap+0x450>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
801059a0:	e8 ab de ff ff       	call   80103850 <myproc>
801059a5:	85 c0                	test   %eax,%eax
801059a7:	74 0f                	je     801059b8 <trap+0x118>
801059a9:	e8 a2 de ff ff       	call   80103850 <myproc>
801059ae:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
801059b2:	0f 84 28 01 00 00    	je     80105ae0 <trap+0x240>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
801059b8:	e8 93 de ff ff       	call   80103850 <myproc>
801059bd:	85 c0                	test   %eax,%eax
801059bf:	74 19                	je     801059da <trap+0x13a>
801059c1:	e8 8a de ff ff       	call   80103850 <myproc>
801059c6:	8b 40 24             	mov    0x24(%eax),%eax
801059c9:	85 c0                	test   %eax,%eax
801059cb:	74 0d                	je     801059da <trap+0x13a>
801059cd:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
801059d1:	83 e0 03             	and    $0x3,%eax
801059d4:	66 83 f8 03          	cmp    $0x3,%ax
801059d8:	74 37                	je     80105a11 <trap+0x171>
    exit();
}
801059da:	8d 65 f4             	lea    -0xc(%ebp),%esp
801059dd:	5b                   	pop    %ebx
801059de:	5e                   	pop    %esi
801059df:	5f                   	pop    %edi
801059e0:	5d                   	pop    %ebp
801059e1:	c3                   	ret    
801059e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(myproc()->killed)
801059e8:	e8 63 de ff ff       	call   80103850 <myproc>
801059ed:	8b 58 24             	mov    0x24(%eax),%ebx
801059f0:	85 db                	test   %ebx,%ebx
801059f2:	0f 85 38 02 00 00    	jne    80105c30 <trap+0x390>
    myproc()->tf = tf;
801059f8:	e8 53 de ff ff       	call   80103850 <myproc>
801059fd:	89 78 18             	mov    %edi,0x18(%eax)
    syscall();
80105a00:	e8 cb ee ff ff       	call   801048d0 <syscall>
    if(myproc()->killed)
80105a05:	e8 46 de ff ff       	call   80103850 <myproc>
80105a0a:	8b 48 24             	mov    0x24(%eax),%ecx
80105a0d:	85 c9                	test   %ecx,%ecx
80105a0f:	74 c9                	je     801059da <trap+0x13a>
}
80105a11:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a14:	5b                   	pop    %ebx
80105a15:	5e                   	pop    %esi
80105a16:	5f                   	pop    %edi
80105a17:	5d                   	pop    %ebp
      exit();
80105a18:	e9 53 e2 ff ff       	jmp    80103c70 <exit>
80105a1d:	8d 76 00             	lea    0x0(%esi),%esi
  if(myproc() != 0 && (tf->cs & 3) == 3 && tf->trapno == T_IRQ0+IRQ_TIMER && 
80105a20:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
80105a24:	0f 85 50 ff ff ff    	jne    8010597a <trap+0xda>
    myproc()->alarmstate == 1 && myproc()->ticksby > myproc()->alarmticks) {
80105a2a:	e8 21 de ff ff       	call   80103850 <myproc>
  if(myproc() != 0 && (tf->cs & 3) == 3 && tf->trapno == T_IRQ0+IRQ_TIMER && 
80105a2f:	83 b8 90 00 00 00 01 	cmpl   $0x1,0x90(%eax)
80105a36:	0f 85 3e ff ff ff    	jne    8010597a <trap+0xda>
    myproc()->alarmstate == 1 && myproc()->ticksby > myproc()->alarmticks) {
80105a3c:	e8 0f de ff ff       	call   80103850 <myproc>
80105a41:	8b 98 80 00 00 00    	mov    0x80(%eax),%ebx
80105a47:	e8 04 de ff ff       	call   80103850 <myproc>
80105a4c:	3b 58 7c             	cmp    0x7c(%eax),%ebx
80105a4f:	0f 8e 25 ff ff ff    	jle    8010597a <trap+0xda>
    myproc()->alarmstate = 2;
80105a55:	e8 f6 dd ff ff       	call   80103850 <myproc>
80105a5a:	c7 80 90 00 00 00 02 	movl   $0x2,0x90(%eax)
80105a61:	00 00 00 
    myproc()->ticksby = 0;
80105a64:	e8 e7 dd ff ff       	call   80103850 <myproc>
80105a69:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80105a70:	00 00 00 
    myproc()->validcheck = tf->esp;
80105a73:	e8 d8 dd ff ff       	call   80103850 <myproc>
80105a78:	8b 57 44             	mov    0x44(%edi),%edx
80105a7b:	89 90 8c 00 00 00    	mov    %edx,0x8c(%eax)
    myproc()->resume = tf->eip;
80105a81:	e8 ca dd ff ff       	call   80103850 <myproc>
80105a86:	8b 57 38             	mov    0x38(%edi),%edx
80105a89:	89 90 88 00 00 00    	mov    %edx,0x88(%eax)
    myproc()->eax = tf->eax;
80105a8f:	e8 bc dd ff ff       	call   80103850 <myproc>
80105a94:	8b 57 1c             	mov    0x1c(%edi),%edx
80105a97:	89 90 94 00 00 00    	mov    %edx,0x94(%eax)
    myproc()->edx = tf->edx;
80105a9d:	e8 ae dd ff ff       	call   80103850 <myproc>
80105aa2:	8b 57 14             	mov    0x14(%edi),%edx
80105aa5:	89 90 98 00 00 00    	mov    %edx,0x98(%eax)
    myproc()->ecx = tf->ecx;
80105aab:	e8 a0 dd ff ff       	call   80103850 <myproc>
80105ab0:	8b 57 18             	mov    0x18(%edi),%edx
80105ab3:	89 90 9c 00 00 00    	mov    %edx,0x9c(%eax)
    tf->esp -= 4;
80105ab9:	8b 47 44             	mov    0x44(%edi),%eax
80105abc:	8d 50 fc             	lea    -0x4(%eax),%edx
80105abf:	89 57 44             	mov    %edx,0x44(%edi)
    *(uint *)(tf->esp) = 0xffffffff;
80105ac2:	c7 40 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%eax)
    tf->eip = myproc()->alarmhandler;
80105ac9:	e8 82 dd ff ff       	call   80103850 <myproc>
80105ace:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
80105ad4:	89 47 38             	mov    %eax,0x38(%edi)
80105ad7:	e9 9e fe ff ff       	jmp    8010597a <trap+0xda>
80105adc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(myproc() && myproc()->state == RUNNING &&
80105ae0:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
80105ae4:	0f 85 ce fe ff ff    	jne    801059b8 <trap+0x118>
    yield();
80105aea:	e8 b1 e2 ff ff       	call   80103da0 <yield>
80105aef:	e9 c4 fe ff ff       	jmp    801059b8 <trap+0x118>
80105af4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		oldsz = myproc()->sz;
80105af8:	e8 53 dd ff ff       	call   80103850 <myproc>
80105afd:	8b 00                	mov    (%eax),%eax
80105aff:	89 45 e0             	mov    %eax,-0x20(%ebp)

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105b02:	0f 20 d3             	mov    %cr2,%ebx
		pgdir = myproc()->pgdir;
80105b05:	e8 46 dd ff ff       	call   80103850 <myproc>
80105b0a:	8b 40 04             	mov    0x4(%eax),%eax
    if(newsz == 0xffffffff && myproc() != 0 && myproc()->alarmstate == 2 && myproc()->validcheck == tf->esp) {
80105b0d:	83 fb ff             	cmp    $0xffffffff,%ebx
		pgdir = myproc()->pgdir;
80105b10:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(newsz == 0xffffffff && myproc() != 0 && myproc()->alarmstate == 2 && myproc()->validcheck == tf->esp) {
80105b13:	0f 84 b7 fd ff ff    	je     801058d0 <trap+0x30>
		if(newsz >= KERNBASE && (tf->cs & 3) == 3) {
80105b19:	85 db                	test   %ebx,%ebx
80105b1b:	0f 88 97 01 00 00    	js     80105cb8 <trap+0x418>
		mem = kalloc();
80105b21:	e8 aa c9 ff ff       	call   801024d0 <kalloc>
		if(mem == 0) {
80105b26:	85 c0                	test   %eax,%eax
		mem = kalloc();
80105b28:	89 c6                	mov    %eax,%esi
		if(mem == 0) {
80105b2a:	0f 84 20 02 00 00    	je     80105d50 <trap+0x4b0>
		memset(mem, 0, PGSIZE);
80105b30:	83 ec 04             	sub    $0x4,%esp
80105b33:	68 00 10 00 00       	push   $0x1000
80105b38:	6a 00                	push   $0x0
80105b3a:	50                   	push   %eax
80105b3b:	e8 a0 e9 ff ff       	call   801044e0 <memset>
		if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0) {
80105b40:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80105b46:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
80105b4d:	50                   	push   %eax
		a = PGROUNDDOWN(newsz);
80105b4e:	89 d8                	mov    %ebx,%eax
		if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0) {
80105b50:	68 00 10 00 00       	push   $0x1000
		a = PGROUNDDOWN(newsz);
80105b55:	25 00 f0 ff ff       	and    $0xfffff000,%eax
		if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0) {
80105b5a:	50                   	push   %eax
80105b5b:	ff 75 e4             	pushl  -0x1c(%ebp)
80105b5e:	e8 0d 10 00 00       	call   80106b70 <mappages>
80105b63:	83 c4 20             	add    $0x20,%esp
80105b66:	85 c0                	test   %eax,%eax
80105b68:	0f 89 f2 fd ff ff    	jns    80105960 <trap+0xc0>
			cprintf("allocuvm out of memory\n");
80105b6e:	83 ec 0c             	sub    $0xc,%esp
80105b71:	68 bd 7a 10 80       	push   $0x80107abd
80105b76:	e8 e5 aa ff ff       	call   80100660 <cprintf>
			deallocuvm(pgdir, newsz, oldsz);
80105b7b:	83 c4 0c             	add    $0xc,%esp
80105b7e:	ff 75 e0             	pushl  -0x20(%ebp)
80105b81:	53                   	push   %ebx
80105b82:	ff 75 e4             	pushl  -0x1c(%ebp)
80105b85:	e8 06 14 00 00       	call   80106f90 <deallocuvm>
			kfree(mem);	
80105b8a:	89 34 24             	mov    %esi,(%esp)
80105b8d:	e8 8e c7 ff ff       	call   80102320 <kfree>
			myproc()->killed = 1;
80105b92:	e8 b9 dc ff ff       	call   80103850 <myproc>
			return;
80105b97:	83 c4 10             	add    $0x10,%esp
			myproc()->killed = 1;
80105b9a:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
			return;
80105ba1:	e9 34 fe ff ff       	jmp    801059da <trap+0x13a>
80105ba6:	8d 76 00             	lea    0x0(%esi),%esi
80105ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(cpuid() == 0){
80105bb0:	e8 7b dc ff ff       	call   80103830 <cpuid>
80105bb5:	85 c0                	test   %eax,%eax
80105bb7:	0f 84 43 01 00 00    	je     80105d00 <trap+0x460>
    lapiceoi();
80105bbd:	e8 9e cb ff ff       	call   80102760 <lapiceoi>
    break;
80105bc2:	e9 99 fd ff ff       	jmp    80105960 <trap+0xc0>
80105bc7:	89 f6                	mov    %esi,%esi
80105bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    kbdintr();
80105bd0:	e8 4b ca ff ff       	call   80102620 <kbdintr>
    lapiceoi();
80105bd5:	e8 86 cb ff ff       	call   80102760 <lapiceoi>
    break;
80105bda:	e9 81 fd ff ff       	jmp    80105960 <trap+0xc0>
80105bdf:	90                   	nop
    uartintr();
80105be0:	e8 4b 03 00 00       	call   80105f30 <uartintr>
    lapiceoi();
80105be5:	e8 76 cb ff ff       	call   80102760 <lapiceoi>
    break;
80105bea:	e9 71 fd ff ff       	jmp    80105960 <trap+0xc0>
80105bef:	90                   	nop
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105bf0:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105bf4:	8b 77 38             	mov    0x38(%edi),%esi
80105bf7:	e8 34 dc ff ff       	call   80103830 <cpuid>
80105bfc:	56                   	push   %esi
80105bfd:	53                   	push   %ebx
80105bfe:	50                   	push   %eax
80105bff:	68 dc 7a 10 80       	push   $0x80107adc
80105c04:	e8 57 aa ff ff       	call   80100660 <cprintf>
    lapiceoi();
80105c09:	e8 52 cb ff ff       	call   80102760 <lapiceoi>
    break;
80105c0e:	83 c4 10             	add    $0x10,%esp
80105c11:	e9 4a fd ff ff       	jmp    80105960 <trap+0xc0>
80105c16:	8d 76 00             	lea    0x0(%esi),%esi
80105c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    ideintr();
80105c20:	e8 6b c4 ff ff       	call   80102090 <ideintr>
80105c25:	eb 96                	jmp    80105bbd <trap+0x31d>
80105c27:	89 f6                	mov    %esi,%esi
80105c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      exit();
80105c30:	e8 3b e0 ff ff       	call   80103c70 <exit>
80105c35:	e9 be fd ff ff       	jmp    801059f8 <trap+0x158>
80105c3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(myproc() == 0 || (tf->cs&3) == 0){
80105c40:	e8 0b dc ff ff       	call   80103850 <myproc>
80105c45:	85 c0                	test   %eax,%eax
80105c47:	0f 84 41 01 00 00    	je     80105d8e <trap+0x4ee>
80105c4d:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
80105c51:	0f 84 37 01 00 00    	je     80105d8e <trap+0x4ee>
80105c57:	0f 20 d1             	mov    %cr2,%ecx
		cprintf("pid %d %s: trap %d err %d on cpu %d "
80105c5a:	8b 57 38             	mov    0x38(%edi),%edx
80105c5d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80105c60:	89 55 dc             	mov    %edx,-0x24(%ebp)
80105c63:	e8 c8 db ff ff       	call   80103830 <cpuid>
80105c68:	8b 77 34             	mov    0x34(%edi),%esi
80105c6b:	8b 5f 30             	mov    0x30(%edi),%ebx
80105c6e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            myproc()->pid, myproc()->name, tf->trapno,
80105c71:	e8 da db ff ff       	call   80103850 <myproc>
80105c76:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105c79:	e8 d2 db ff ff       	call   80103850 <myproc>
		cprintf("pid %d %s: trap %d err %d on cpu %d "
80105c7e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105c81:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105c84:	51                   	push   %ecx
80105c85:	52                   	push   %edx
            myproc()->pid, myproc()->name, tf->trapno,
80105c86:	8b 55 e0             	mov    -0x20(%ebp),%edx
		cprintf("pid %d %s: trap %d err %d on cpu %d "
80105c89:	ff 75 e4             	pushl  -0x1c(%ebp)
80105c8c:	56                   	push   %esi
80105c8d:	53                   	push   %ebx
            myproc()->pid, myproc()->name, tf->trapno,
80105c8e:	83 c2 6c             	add    $0x6c,%edx
		cprintf("pid %d %s: trap %d err %d on cpu %d "
80105c91:	52                   	push   %edx
80105c92:	ff 70 10             	pushl  0x10(%eax)
80105c95:	68 34 7b 10 80       	push   $0x80107b34
80105c9a:	e8 c1 a9 ff ff       	call   80100660 <cprintf>
    myproc()->killed = 1;
80105c9f:	83 c4 20             	add    $0x20,%esp
80105ca2:	e8 a9 db ff ff       	call   80103850 <myproc>
80105ca7:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80105cae:	e9 ad fc ff ff       	jmp    80105960 <trap+0xc0>
80105cb3:	90                   	nop
80105cb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		if(newsz >= KERNBASE && (tf->cs & 3) == 3) {
80105cb8:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105cbc:	83 e0 03             	and    $0x3,%eax
80105cbf:	66 83 f8 03          	cmp    $0x3,%ax
80105cc3:	0f 85 58 fe ff ff    	jne    80105b21 <trap+0x281>
			cprintf("illegal kernel access\n");
80105cc9:	83 ec 0c             	sub    $0xc,%esp
80105ccc:	68 a6 7a 10 80       	push   $0x80107aa6
80105cd1:	e8 8a a9 ff ff       	call   80100660 <cprintf>
      myproc()->killed = 1;	
80105cd6:	e8 75 db ff ff       	call   80103850 <myproc>
			return;
80105cdb:	83 c4 10             	add    $0x10,%esp
      myproc()->killed = 1;	
80105cde:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
			return;
80105ce5:	e9 f0 fc ff ff       	jmp    801059da <trap+0x13a>
80105cea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    exit();
80105cf0:	e8 7b df ff ff       	call   80103c70 <exit>
80105cf5:	e9 a6 fc ff ff       	jmp    801059a0 <trap+0x100>
80105cfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      acquire(&tickslock);
80105d00:	83 ec 0c             	sub    $0xc,%esp
80105d03:	68 60 55 11 80       	push   $0x80115560
80105d08:	e8 c3 e6 ff ff       	call   801043d0 <acquire>
      ticks++;
80105d0d:	83 05 a0 5d 11 80 01 	addl   $0x1,0x80115da0
      if(myproc() != 0 && myproc()->alarmstate == 1) {
80105d14:	e8 37 db ff ff       	call   80103850 <myproc>
80105d19:	83 c4 10             	add    $0x10,%esp
80105d1c:	85 c0                	test   %eax,%eax
80105d1e:	74 0e                	je     80105d2e <trap+0x48e>
80105d20:	e8 2b db ff ff       	call   80103850 <myproc>
80105d25:	83 b8 90 00 00 00 01 	cmpl   $0x1,0x90(%eax)
80105d2c:	74 52                	je     80105d80 <trap+0x4e0>
      wakeup(&ticks);
80105d2e:	83 ec 0c             	sub    $0xc,%esp
80105d31:	68 a0 5d 11 80       	push   $0x80115da0
80105d36:	e8 75 e2 ff ff       	call   80103fb0 <wakeup>
      release(&tickslock);
80105d3b:	c7 04 24 60 55 11 80 	movl   $0x80115560,(%esp)
80105d42:	e8 49 e7 ff ff       	call   80104490 <release>
80105d47:	83 c4 10             	add    $0x10,%esp
80105d4a:	e9 6e fe ff ff       	jmp    80105bbd <trap+0x31d>
80105d4f:	90                   	nop
			cprintf("allocuvm out of memory\n");
80105d50:	83 ec 0c             	sub    $0xc,%esp
80105d53:	68 bd 7a 10 80       	push   $0x80107abd
80105d58:	e8 03 a9 ff ff       	call   80100660 <cprintf>
			deallocuvm(pgdir, newsz, oldsz);
80105d5d:	83 c4 0c             	add    $0xc,%esp
80105d60:	ff 75 e0             	pushl  -0x20(%ebp)
80105d63:	53                   	push   %ebx
80105d64:	ff 75 e4             	pushl  -0x1c(%ebp)
80105d67:	e8 24 12 00 00       	call   80106f90 <deallocuvm>
			myproc()->killed = 1;
80105d6c:	e8 df da ff ff       	call   80103850 <myproc>
			return;
80105d71:	83 c4 10             	add    $0x10,%esp
			myproc()->killed = 1;
80105d74:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
			return;
80105d7b:	e9 5a fc ff ff       	jmp    801059da <trap+0x13a>
        myproc()->ticksby++;
80105d80:	e8 cb da ff ff       	call   80103850 <myproc>
80105d85:	83 80 80 00 00 00 01 	addl   $0x1,0x80(%eax)
80105d8c:	eb a0                	jmp    80105d2e <trap+0x48e>
80105d8e:	0f 20 d6             	mov    %cr2,%esi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105d91:	8b 5f 38             	mov    0x38(%edi),%ebx
80105d94:	e8 97 da ff ff       	call   80103830 <cpuid>
80105d99:	83 ec 0c             	sub    $0xc,%esp
80105d9c:	56                   	push   %esi
80105d9d:	53                   	push   %ebx
80105d9e:	50                   	push   %eax
80105d9f:	ff 77 30             	pushl  0x30(%edi)
80105da2:	68 00 7b 10 80       	push   $0x80107b00
80105da7:	e8 b4 a8 ff ff       	call   80100660 <cprintf>
      panic("trap");
80105dac:	83 c4 14             	add    $0x14,%esp
80105daf:	68 d5 7a 10 80       	push   $0x80107ad5
80105db4:	e8 d7 a5 ff ff       	call   80100390 <panic>
80105db9:	66 90                	xchg   %ax,%ax
80105dbb:	66 90                	xchg   %ax,%ax
80105dbd:	66 90                	xchg   %ax,%ax
80105dbf:	90                   	nop

80105dc0 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105dc0:	a1 bc a5 10 80       	mov    0x8010a5bc,%eax
{
80105dc5:	55                   	push   %ebp
80105dc6:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105dc8:	85 c0                	test   %eax,%eax
80105dca:	74 1c                	je     80105de8 <uartgetc+0x28>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105dcc:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105dd1:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105dd2:	a8 01                	test   $0x1,%al
80105dd4:	74 12                	je     80105de8 <uartgetc+0x28>
80105dd6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105ddb:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105ddc:	0f b6 c0             	movzbl %al,%eax
}
80105ddf:	5d                   	pop    %ebp
80105de0:	c3                   	ret    
80105de1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105de8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105ded:	5d                   	pop    %ebp
80105dee:	c3                   	ret    
80105def:	90                   	nop

80105df0 <uartputc.part.0>:
uartputc(int c)
80105df0:	55                   	push   %ebp
80105df1:	89 e5                	mov    %esp,%ebp
80105df3:	57                   	push   %edi
80105df4:	56                   	push   %esi
80105df5:	53                   	push   %ebx
80105df6:	89 c7                	mov    %eax,%edi
80105df8:	bb 80 00 00 00       	mov    $0x80,%ebx
80105dfd:	be fd 03 00 00       	mov    $0x3fd,%esi
80105e02:	83 ec 0c             	sub    $0xc,%esp
80105e05:	eb 1b                	jmp    80105e22 <uartputc.part.0+0x32>
80105e07:	89 f6                	mov    %esi,%esi
80105e09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    microdelay(10);
80105e10:	83 ec 0c             	sub    $0xc,%esp
80105e13:	6a 0a                	push   $0xa
80105e15:	e8 66 c9 ff ff       	call   80102780 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105e1a:	83 c4 10             	add    $0x10,%esp
80105e1d:	83 eb 01             	sub    $0x1,%ebx
80105e20:	74 07                	je     80105e29 <uartputc.part.0+0x39>
80105e22:	89 f2                	mov    %esi,%edx
80105e24:	ec                   	in     (%dx),%al
80105e25:	a8 20                	test   $0x20,%al
80105e27:	74 e7                	je     80105e10 <uartputc.part.0+0x20>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105e29:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105e2e:	89 f8                	mov    %edi,%eax
80105e30:	ee                   	out    %al,(%dx)
}
80105e31:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105e34:	5b                   	pop    %ebx
80105e35:	5e                   	pop    %esi
80105e36:	5f                   	pop    %edi
80105e37:	5d                   	pop    %ebp
80105e38:	c3                   	ret    
80105e39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105e40 <uartinit>:
{
80105e40:	55                   	push   %ebp
80105e41:	31 c9                	xor    %ecx,%ecx
80105e43:	89 c8                	mov    %ecx,%eax
80105e45:	89 e5                	mov    %esp,%ebp
80105e47:	57                   	push   %edi
80105e48:	56                   	push   %esi
80105e49:	53                   	push   %ebx
80105e4a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105e4f:	89 da                	mov    %ebx,%edx
80105e51:	83 ec 0c             	sub    $0xc,%esp
80105e54:	ee                   	out    %al,(%dx)
80105e55:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105e5a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105e5f:	89 fa                	mov    %edi,%edx
80105e61:	ee                   	out    %al,(%dx)
80105e62:	b8 0c 00 00 00       	mov    $0xc,%eax
80105e67:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105e6c:	ee                   	out    %al,(%dx)
80105e6d:	be f9 03 00 00       	mov    $0x3f9,%esi
80105e72:	89 c8                	mov    %ecx,%eax
80105e74:	89 f2                	mov    %esi,%edx
80105e76:	ee                   	out    %al,(%dx)
80105e77:	b8 03 00 00 00       	mov    $0x3,%eax
80105e7c:	89 fa                	mov    %edi,%edx
80105e7e:	ee                   	out    %al,(%dx)
80105e7f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105e84:	89 c8                	mov    %ecx,%eax
80105e86:	ee                   	out    %al,(%dx)
80105e87:	b8 01 00 00 00       	mov    $0x1,%eax
80105e8c:	89 f2                	mov    %esi,%edx
80105e8e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105e8f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105e94:	ec                   	in     (%dx),%al
  if(inb(COM1+5) == 0xFF)
80105e95:	3c ff                	cmp    $0xff,%al
80105e97:	74 5a                	je     80105ef3 <uartinit+0xb3>
  uart = 1;
80105e99:	c7 05 bc a5 10 80 01 	movl   $0x1,0x8010a5bc
80105ea0:	00 00 00 
80105ea3:	89 da                	mov    %ebx,%edx
80105ea5:	ec                   	in     (%dx),%al
80105ea6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105eab:	ec                   	in     (%dx),%al
  ioapicenable(IRQ_COM1, 0);
80105eac:	83 ec 08             	sub    $0x8,%esp
  for(p="xv6...\n"; *p; p++)
80105eaf:	bb 40 7c 10 80       	mov    $0x80107c40,%ebx
  ioapicenable(IRQ_COM1, 0);
80105eb4:	6a 00                	push   $0x0
80105eb6:	6a 04                	push   $0x4
80105eb8:	e8 23 c4 ff ff       	call   801022e0 <ioapicenable>
80105ebd:	83 c4 10             	add    $0x10,%esp
  for(p="xv6...\n"; *p; p++)
80105ec0:	b8 78 00 00 00       	mov    $0x78,%eax
80105ec5:	eb 13                	jmp    80105eda <uartinit+0x9a>
80105ec7:	89 f6                	mov    %esi,%esi
80105ec9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105ed0:	83 c3 01             	add    $0x1,%ebx
80105ed3:	0f be 03             	movsbl (%ebx),%eax
80105ed6:	84 c0                	test   %al,%al
80105ed8:	74 19                	je     80105ef3 <uartinit+0xb3>
  if(!uart)
80105eda:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
80105ee0:	85 d2                	test   %edx,%edx
80105ee2:	74 ec                	je     80105ed0 <uartinit+0x90>
  for(p="xv6...\n"; *p; p++)
80105ee4:	83 c3 01             	add    $0x1,%ebx
80105ee7:	e8 04 ff ff ff       	call   80105df0 <uartputc.part.0>
80105eec:	0f be 03             	movsbl (%ebx),%eax
80105eef:	84 c0                	test   %al,%al
80105ef1:	75 e7                	jne    80105eda <uartinit+0x9a>
}
80105ef3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105ef6:	5b                   	pop    %ebx
80105ef7:	5e                   	pop    %esi
80105ef8:	5f                   	pop    %edi
80105ef9:	5d                   	pop    %ebp
80105efa:	c3                   	ret    
80105efb:	90                   	nop
80105efc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105f00 <uartputc>:
  if(!uart)
80105f00:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
{
80105f06:	55                   	push   %ebp
80105f07:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105f09:	85 d2                	test   %edx,%edx
{
80105f0b:	8b 45 08             	mov    0x8(%ebp),%eax
  if(!uart)
80105f0e:	74 10                	je     80105f20 <uartputc+0x20>
}
80105f10:	5d                   	pop    %ebp
80105f11:	e9 da fe ff ff       	jmp    80105df0 <uartputc.part.0>
80105f16:	8d 76 00             	lea    0x0(%esi),%esi
80105f19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105f20:	5d                   	pop    %ebp
80105f21:	c3                   	ret    
80105f22:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105f29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105f30 <uartintr>:

void
uartintr(void)
{
80105f30:	55                   	push   %ebp
80105f31:	89 e5                	mov    %esp,%ebp
80105f33:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
80105f36:	68 c0 5d 10 80       	push   $0x80105dc0
80105f3b:	e8 d0 a8 ff ff       	call   80100810 <consoleintr>
}
80105f40:	83 c4 10             	add    $0x10,%esp
80105f43:	c9                   	leave  
80105f44:	c3                   	ret    

80105f45 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
80105f45:	6a 00                	push   $0x0
  pushl $0
80105f47:	6a 00                	push   $0x0
  jmp alltraps
80105f49:	e9 79 f8 ff ff       	jmp    801057c7 <alltraps>

80105f4e <vector1>:
.globl vector1
vector1:
  pushl $0
80105f4e:	6a 00                	push   $0x0
  pushl $1
80105f50:	6a 01                	push   $0x1
  jmp alltraps
80105f52:	e9 70 f8 ff ff       	jmp    801057c7 <alltraps>

80105f57 <vector2>:
.globl vector2
vector2:
  pushl $0
80105f57:	6a 00                	push   $0x0
  pushl $2
80105f59:	6a 02                	push   $0x2
  jmp alltraps
80105f5b:	e9 67 f8 ff ff       	jmp    801057c7 <alltraps>

80105f60 <vector3>:
.globl vector3
vector3:
  pushl $0
80105f60:	6a 00                	push   $0x0
  pushl $3
80105f62:	6a 03                	push   $0x3
  jmp alltraps
80105f64:	e9 5e f8 ff ff       	jmp    801057c7 <alltraps>

80105f69 <vector4>:
.globl vector4
vector4:
  pushl $0
80105f69:	6a 00                	push   $0x0
  pushl $4
80105f6b:	6a 04                	push   $0x4
  jmp alltraps
80105f6d:	e9 55 f8 ff ff       	jmp    801057c7 <alltraps>

80105f72 <vector5>:
.globl vector5
vector5:
  pushl $0
80105f72:	6a 00                	push   $0x0
  pushl $5
80105f74:	6a 05                	push   $0x5
  jmp alltraps
80105f76:	e9 4c f8 ff ff       	jmp    801057c7 <alltraps>

80105f7b <vector6>:
.globl vector6
vector6:
  pushl $0
80105f7b:	6a 00                	push   $0x0
  pushl $6
80105f7d:	6a 06                	push   $0x6
  jmp alltraps
80105f7f:	e9 43 f8 ff ff       	jmp    801057c7 <alltraps>

80105f84 <vector7>:
.globl vector7
vector7:
  pushl $0
80105f84:	6a 00                	push   $0x0
  pushl $7
80105f86:	6a 07                	push   $0x7
  jmp alltraps
80105f88:	e9 3a f8 ff ff       	jmp    801057c7 <alltraps>

80105f8d <vector8>:
.globl vector8
vector8:
  pushl $8
80105f8d:	6a 08                	push   $0x8
  jmp alltraps
80105f8f:	e9 33 f8 ff ff       	jmp    801057c7 <alltraps>

80105f94 <vector9>:
.globl vector9
vector9:
  pushl $0
80105f94:	6a 00                	push   $0x0
  pushl $9
80105f96:	6a 09                	push   $0x9
  jmp alltraps
80105f98:	e9 2a f8 ff ff       	jmp    801057c7 <alltraps>

80105f9d <vector10>:
.globl vector10
vector10:
  pushl $10
80105f9d:	6a 0a                	push   $0xa
  jmp alltraps
80105f9f:	e9 23 f8 ff ff       	jmp    801057c7 <alltraps>

80105fa4 <vector11>:
.globl vector11
vector11:
  pushl $11
80105fa4:	6a 0b                	push   $0xb
  jmp alltraps
80105fa6:	e9 1c f8 ff ff       	jmp    801057c7 <alltraps>

80105fab <vector12>:
.globl vector12
vector12:
  pushl $12
80105fab:	6a 0c                	push   $0xc
  jmp alltraps
80105fad:	e9 15 f8 ff ff       	jmp    801057c7 <alltraps>

80105fb2 <vector13>:
.globl vector13
vector13:
  pushl $13
80105fb2:	6a 0d                	push   $0xd
  jmp alltraps
80105fb4:	e9 0e f8 ff ff       	jmp    801057c7 <alltraps>

80105fb9 <vector14>:
.globl vector14
vector14:
  pushl $14
80105fb9:	6a 0e                	push   $0xe
  jmp alltraps
80105fbb:	e9 07 f8 ff ff       	jmp    801057c7 <alltraps>

80105fc0 <vector15>:
.globl vector15
vector15:
  pushl $0
80105fc0:	6a 00                	push   $0x0
  pushl $15
80105fc2:	6a 0f                	push   $0xf
  jmp alltraps
80105fc4:	e9 fe f7 ff ff       	jmp    801057c7 <alltraps>

80105fc9 <vector16>:
.globl vector16
vector16:
  pushl $0
80105fc9:	6a 00                	push   $0x0
  pushl $16
80105fcb:	6a 10                	push   $0x10
  jmp alltraps
80105fcd:	e9 f5 f7 ff ff       	jmp    801057c7 <alltraps>

80105fd2 <vector17>:
.globl vector17
vector17:
  pushl $17
80105fd2:	6a 11                	push   $0x11
  jmp alltraps
80105fd4:	e9 ee f7 ff ff       	jmp    801057c7 <alltraps>

80105fd9 <vector18>:
.globl vector18
vector18:
  pushl $0
80105fd9:	6a 00                	push   $0x0
  pushl $18
80105fdb:	6a 12                	push   $0x12
  jmp alltraps
80105fdd:	e9 e5 f7 ff ff       	jmp    801057c7 <alltraps>

80105fe2 <vector19>:
.globl vector19
vector19:
  pushl $0
80105fe2:	6a 00                	push   $0x0
  pushl $19
80105fe4:	6a 13                	push   $0x13
  jmp alltraps
80105fe6:	e9 dc f7 ff ff       	jmp    801057c7 <alltraps>

80105feb <vector20>:
.globl vector20
vector20:
  pushl $0
80105feb:	6a 00                	push   $0x0
  pushl $20
80105fed:	6a 14                	push   $0x14
  jmp alltraps
80105fef:	e9 d3 f7 ff ff       	jmp    801057c7 <alltraps>

80105ff4 <vector21>:
.globl vector21
vector21:
  pushl $0
80105ff4:	6a 00                	push   $0x0
  pushl $21
80105ff6:	6a 15                	push   $0x15
  jmp alltraps
80105ff8:	e9 ca f7 ff ff       	jmp    801057c7 <alltraps>

80105ffd <vector22>:
.globl vector22
vector22:
  pushl $0
80105ffd:	6a 00                	push   $0x0
  pushl $22
80105fff:	6a 16                	push   $0x16
  jmp alltraps
80106001:	e9 c1 f7 ff ff       	jmp    801057c7 <alltraps>

80106006 <vector23>:
.globl vector23
vector23:
  pushl $0
80106006:	6a 00                	push   $0x0
  pushl $23
80106008:	6a 17                	push   $0x17
  jmp alltraps
8010600a:	e9 b8 f7 ff ff       	jmp    801057c7 <alltraps>

8010600f <vector24>:
.globl vector24
vector24:
  pushl $0
8010600f:	6a 00                	push   $0x0
  pushl $24
80106011:	6a 18                	push   $0x18
  jmp alltraps
80106013:	e9 af f7 ff ff       	jmp    801057c7 <alltraps>

80106018 <vector25>:
.globl vector25
vector25:
  pushl $0
80106018:	6a 00                	push   $0x0
  pushl $25
8010601a:	6a 19                	push   $0x19
  jmp alltraps
8010601c:	e9 a6 f7 ff ff       	jmp    801057c7 <alltraps>

80106021 <vector26>:
.globl vector26
vector26:
  pushl $0
80106021:	6a 00                	push   $0x0
  pushl $26
80106023:	6a 1a                	push   $0x1a
  jmp alltraps
80106025:	e9 9d f7 ff ff       	jmp    801057c7 <alltraps>

8010602a <vector27>:
.globl vector27
vector27:
  pushl $0
8010602a:	6a 00                	push   $0x0
  pushl $27
8010602c:	6a 1b                	push   $0x1b
  jmp alltraps
8010602e:	e9 94 f7 ff ff       	jmp    801057c7 <alltraps>

80106033 <vector28>:
.globl vector28
vector28:
  pushl $0
80106033:	6a 00                	push   $0x0
  pushl $28
80106035:	6a 1c                	push   $0x1c
  jmp alltraps
80106037:	e9 8b f7 ff ff       	jmp    801057c7 <alltraps>

8010603c <vector29>:
.globl vector29
vector29:
  pushl $0
8010603c:	6a 00                	push   $0x0
  pushl $29
8010603e:	6a 1d                	push   $0x1d
  jmp alltraps
80106040:	e9 82 f7 ff ff       	jmp    801057c7 <alltraps>

80106045 <vector30>:
.globl vector30
vector30:
  pushl $0
80106045:	6a 00                	push   $0x0
  pushl $30
80106047:	6a 1e                	push   $0x1e
  jmp alltraps
80106049:	e9 79 f7 ff ff       	jmp    801057c7 <alltraps>

8010604e <vector31>:
.globl vector31
vector31:
  pushl $0
8010604e:	6a 00                	push   $0x0
  pushl $31
80106050:	6a 1f                	push   $0x1f
  jmp alltraps
80106052:	e9 70 f7 ff ff       	jmp    801057c7 <alltraps>

80106057 <vector32>:
.globl vector32
vector32:
  pushl $0
80106057:	6a 00                	push   $0x0
  pushl $32
80106059:	6a 20                	push   $0x20
  jmp alltraps
8010605b:	e9 67 f7 ff ff       	jmp    801057c7 <alltraps>

80106060 <vector33>:
.globl vector33
vector33:
  pushl $0
80106060:	6a 00                	push   $0x0
  pushl $33
80106062:	6a 21                	push   $0x21
  jmp alltraps
80106064:	e9 5e f7 ff ff       	jmp    801057c7 <alltraps>

80106069 <vector34>:
.globl vector34
vector34:
  pushl $0
80106069:	6a 00                	push   $0x0
  pushl $34
8010606b:	6a 22                	push   $0x22
  jmp alltraps
8010606d:	e9 55 f7 ff ff       	jmp    801057c7 <alltraps>

80106072 <vector35>:
.globl vector35
vector35:
  pushl $0
80106072:	6a 00                	push   $0x0
  pushl $35
80106074:	6a 23                	push   $0x23
  jmp alltraps
80106076:	e9 4c f7 ff ff       	jmp    801057c7 <alltraps>

8010607b <vector36>:
.globl vector36
vector36:
  pushl $0
8010607b:	6a 00                	push   $0x0
  pushl $36
8010607d:	6a 24                	push   $0x24
  jmp alltraps
8010607f:	e9 43 f7 ff ff       	jmp    801057c7 <alltraps>

80106084 <vector37>:
.globl vector37
vector37:
  pushl $0
80106084:	6a 00                	push   $0x0
  pushl $37
80106086:	6a 25                	push   $0x25
  jmp alltraps
80106088:	e9 3a f7 ff ff       	jmp    801057c7 <alltraps>

8010608d <vector38>:
.globl vector38
vector38:
  pushl $0
8010608d:	6a 00                	push   $0x0
  pushl $38
8010608f:	6a 26                	push   $0x26
  jmp alltraps
80106091:	e9 31 f7 ff ff       	jmp    801057c7 <alltraps>

80106096 <vector39>:
.globl vector39
vector39:
  pushl $0
80106096:	6a 00                	push   $0x0
  pushl $39
80106098:	6a 27                	push   $0x27
  jmp alltraps
8010609a:	e9 28 f7 ff ff       	jmp    801057c7 <alltraps>

8010609f <vector40>:
.globl vector40
vector40:
  pushl $0
8010609f:	6a 00                	push   $0x0
  pushl $40
801060a1:	6a 28                	push   $0x28
  jmp alltraps
801060a3:	e9 1f f7 ff ff       	jmp    801057c7 <alltraps>

801060a8 <vector41>:
.globl vector41
vector41:
  pushl $0
801060a8:	6a 00                	push   $0x0
  pushl $41
801060aa:	6a 29                	push   $0x29
  jmp alltraps
801060ac:	e9 16 f7 ff ff       	jmp    801057c7 <alltraps>

801060b1 <vector42>:
.globl vector42
vector42:
  pushl $0
801060b1:	6a 00                	push   $0x0
  pushl $42
801060b3:	6a 2a                	push   $0x2a
  jmp alltraps
801060b5:	e9 0d f7 ff ff       	jmp    801057c7 <alltraps>

801060ba <vector43>:
.globl vector43
vector43:
  pushl $0
801060ba:	6a 00                	push   $0x0
  pushl $43
801060bc:	6a 2b                	push   $0x2b
  jmp alltraps
801060be:	e9 04 f7 ff ff       	jmp    801057c7 <alltraps>

801060c3 <vector44>:
.globl vector44
vector44:
  pushl $0
801060c3:	6a 00                	push   $0x0
  pushl $44
801060c5:	6a 2c                	push   $0x2c
  jmp alltraps
801060c7:	e9 fb f6 ff ff       	jmp    801057c7 <alltraps>

801060cc <vector45>:
.globl vector45
vector45:
  pushl $0
801060cc:	6a 00                	push   $0x0
  pushl $45
801060ce:	6a 2d                	push   $0x2d
  jmp alltraps
801060d0:	e9 f2 f6 ff ff       	jmp    801057c7 <alltraps>

801060d5 <vector46>:
.globl vector46
vector46:
  pushl $0
801060d5:	6a 00                	push   $0x0
  pushl $46
801060d7:	6a 2e                	push   $0x2e
  jmp alltraps
801060d9:	e9 e9 f6 ff ff       	jmp    801057c7 <alltraps>

801060de <vector47>:
.globl vector47
vector47:
  pushl $0
801060de:	6a 00                	push   $0x0
  pushl $47
801060e0:	6a 2f                	push   $0x2f
  jmp alltraps
801060e2:	e9 e0 f6 ff ff       	jmp    801057c7 <alltraps>

801060e7 <vector48>:
.globl vector48
vector48:
  pushl $0
801060e7:	6a 00                	push   $0x0
  pushl $48
801060e9:	6a 30                	push   $0x30
  jmp alltraps
801060eb:	e9 d7 f6 ff ff       	jmp    801057c7 <alltraps>

801060f0 <vector49>:
.globl vector49
vector49:
  pushl $0
801060f0:	6a 00                	push   $0x0
  pushl $49
801060f2:	6a 31                	push   $0x31
  jmp alltraps
801060f4:	e9 ce f6 ff ff       	jmp    801057c7 <alltraps>

801060f9 <vector50>:
.globl vector50
vector50:
  pushl $0
801060f9:	6a 00                	push   $0x0
  pushl $50
801060fb:	6a 32                	push   $0x32
  jmp alltraps
801060fd:	e9 c5 f6 ff ff       	jmp    801057c7 <alltraps>

80106102 <vector51>:
.globl vector51
vector51:
  pushl $0
80106102:	6a 00                	push   $0x0
  pushl $51
80106104:	6a 33                	push   $0x33
  jmp alltraps
80106106:	e9 bc f6 ff ff       	jmp    801057c7 <alltraps>

8010610b <vector52>:
.globl vector52
vector52:
  pushl $0
8010610b:	6a 00                	push   $0x0
  pushl $52
8010610d:	6a 34                	push   $0x34
  jmp alltraps
8010610f:	e9 b3 f6 ff ff       	jmp    801057c7 <alltraps>

80106114 <vector53>:
.globl vector53
vector53:
  pushl $0
80106114:	6a 00                	push   $0x0
  pushl $53
80106116:	6a 35                	push   $0x35
  jmp alltraps
80106118:	e9 aa f6 ff ff       	jmp    801057c7 <alltraps>

8010611d <vector54>:
.globl vector54
vector54:
  pushl $0
8010611d:	6a 00                	push   $0x0
  pushl $54
8010611f:	6a 36                	push   $0x36
  jmp alltraps
80106121:	e9 a1 f6 ff ff       	jmp    801057c7 <alltraps>

80106126 <vector55>:
.globl vector55
vector55:
  pushl $0
80106126:	6a 00                	push   $0x0
  pushl $55
80106128:	6a 37                	push   $0x37
  jmp alltraps
8010612a:	e9 98 f6 ff ff       	jmp    801057c7 <alltraps>

8010612f <vector56>:
.globl vector56
vector56:
  pushl $0
8010612f:	6a 00                	push   $0x0
  pushl $56
80106131:	6a 38                	push   $0x38
  jmp alltraps
80106133:	e9 8f f6 ff ff       	jmp    801057c7 <alltraps>

80106138 <vector57>:
.globl vector57
vector57:
  pushl $0
80106138:	6a 00                	push   $0x0
  pushl $57
8010613a:	6a 39                	push   $0x39
  jmp alltraps
8010613c:	e9 86 f6 ff ff       	jmp    801057c7 <alltraps>

80106141 <vector58>:
.globl vector58
vector58:
  pushl $0
80106141:	6a 00                	push   $0x0
  pushl $58
80106143:	6a 3a                	push   $0x3a
  jmp alltraps
80106145:	e9 7d f6 ff ff       	jmp    801057c7 <alltraps>

8010614a <vector59>:
.globl vector59
vector59:
  pushl $0
8010614a:	6a 00                	push   $0x0
  pushl $59
8010614c:	6a 3b                	push   $0x3b
  jmp alltraps
8010614e:	e9 74 f6 ff ff       	jmp    801057c7 <alltraps>

80106153 <vector60>:
.globl vector60
vector60:
  pushl $0
80106153:	6a 00                	push   $0x0
  pushl $60
80106155:	6a 3c                	push   $0x3c
  jmp alltraps
80106157:	e9 6b f6 ff ff       	jmp    801057c7 <alltraps>

8010615c <vector61>:
.globl vector61
vector61:
  pushl $0
8010615c:	6a 00                	push   $0x0
  pushl $61
8010615e:	6a 3d                	push   $0x3d
  jmp alltraps
80106160:	e9 62 f6 ff ff       	jmp    801057c7 <alltraps>

80106165 <vector62>:
.globl vector62
vector62:
  pushl $0
80106165:	6a 00                	push   $0x0
  pushl $62
80106167:	6a 3e                	push   $0x3e
  jmp alltraps
80106169:	e9 59 f6 ff ff       	jmp    801057c7 <alltraps>

8010616e <vector63>:
.globl vector63
vector63:
  pushl $0
8010616e:	6a 00                	push   $0x0
  pushl $63
80106170:	6a 3f                	push   $0x3f
  jmp alltraps
80106172:	e9 50 f6 ff ff       	jmp    801057c7 <alltraps>

80106177 <vector64>:
.globl vector64
vector64:
  pushl $0
80106177:	6a 00                	push   $0x0
  pushl $64
80106179:	6a 40                	push   $0x40
  jmp alltraps
8010617b:	e9 47 f6 ff ff       	jmp    801057c7 <alltraps>

80106180 <vector65>:
.globl vector65
vector65:
  pushl $0
80106180:	6a 00                	push   $0x0
  pushl $65
80106182:	6a 41                	push   $0x41
  jmp alltraps
80106184:	e9 3e f6 ff ff       	jmp    801057c7 <alltraps>

80106189 <vector66>:
.globl vector66
vector66:
  pushl $0
80106189:	6a 00                	push   $0x0
  pushl $66
8010618b:	6a 42                	push   $0x42
  jmp alltraps
8010618d:	e9 35 f6 ff ff       	jmp    801057c7 <alltraps>

80106192 <vector67>:
.globl vector67
vector67:
  pushl $0
80106192:	6a 00                	push   $0x0
  pushl $67
80106194:	6a 43                	push   $0x43
  jmp alltraps
80106196:	e9 2c f6 ff ff       	jmp    801057c7 <alltraps>

8010619b <vector68>:
.globl vector68
vector68:
  pushl $0
8010619b:	6a 00                	push   $0x0
  pushl $68
8010619d:	6a 44                	push   $0x44
  jmp alltraps
8010619f:	e9 23 f6 ff ff       	jmp    801057c7 <alltraps>

801061a4 <vector69>:
.globl vector69
vector69:
  pushl $0
801061a4:	6a 00                	push   $0x0
  pushl $69
801061a6:	6a 45                	push   $0x45
  jmp alltraps
801061a8:	e9 1a f6 ff ff       	jmp    801057c7 <alltraps>

801061ad <vector70>:
.globl vector70
vector70:
  pushl $0
801061ad:	6a 00                	push   $0x0
  pushl $70
801061af:	6a 46                	push   $0x46
  jmp alltraps
801061b1:	e9 11 f6 ff ff       	jmp    801057c7 <alltraps>

801061b6 <vector71>:
.globl vector71
vector71:
  pushl $0
801061b6:	6a 00                	push   $0x0
  pushl $71
801061b8:	6a 47                	push   $0x47
  jmp alltraps
801061ba:	e9 08 f6 ff ff       	jmp    801057c7 <alltraps>

801061bf <vector72>:
.globl vector72
vector72:
  pushl $0
801061bf:	6a 00                	push   $0x0
  pushl $72
801061c1:	6a 48                	push   $0x48
  jmp alltraps
801061c3:	e9 ff f5 ff ff       	jmp    801057c7 <alltraps>

801061c8 <vector73>:
.globl vector73
vector73:
  pushl $0
801061c8:	6a 00                	push   $0x0
  pushl $73
801061ca:	6a 49                	push   $0x49
  jmp alltraps
801061cc:	e9 f6 f5 ff ff       	jmp    801057c7 <alltraps>

801061d1 <vector74>:
.globl vector74
vector74:
  pushl $0
801061d1:	6a 00                	push   $0x0
  pushl $74
801061d3:	6a 4a                	push   $0x4a
  jmp alltraps
801061d5:	e9 ed f5 ff ff       	jmp    801057c7 <alltraps>

801061da <vector75>:
.globl vector75
vector75:
  pushl $0
801061da:	6a 00                	push   $0x0
  pushl $75
801061dc:	6a 4b                	push   $0x4b
  jmp alltraps
801061de:	e9 e4 f5 ff ff       	jmp    801057c7 <alltraps>

801061e3 <vector76>:
.globl vector76
vector76:
  pushl $0
801061e3:	6a 00                	push   $0x0
  pushl $76
801061e5:	6a 4c                	push   $0x4c
  jmp alltraps
801061e7:	e9 db f5 ff ff       	jmp    801057c7 <alltraps>

801061ec <vector77>:
.globl vector77
vector77:
  pushl $0
801061ec:	6a 00                	push   $0x0
  pushl $77
801061ee:	6a 4d                	push   $0x4d
  jmp alltraps
801061f0:	e9 d2 f5 ff ff       	jmp    801057c7 <alltraps>

801061f5 <vector78>:
.globl vector78
vector78:
  pushl $0
801061f5:	6a 00                	push   $0x0
  pushl $78
801061f7:	6a 4e                	push   $0x4e
  jmp alltraps
801061f9:	e9 c9 f5 ff ff       	jmp    801057c7 <alltraps>

801061fe <vector79>:
.globl vector79
vector79:
  pushl $0
801061fe:	6a 00                	push   $0x0
  pushl $79
80106200:	6a 4f                	push   $0x4f
  jmp alltraps
80106202:	e9 c0 f5 ff ff       	jmp    801057c7 <alltraps>

80106207 <vector80>:
.globl vector80
vector80:
  pushl $0
80106207:	6a 00                	push   $0x0
  pushl $80
80106209:	6a 50                	push   $0x50
  jmp alltraps
8010620b:	e9 b7 f5 ff ff       	jmp    801057c7 <alltraps>

80106210 <vector81>:
.globl vector81
vector81:
  pushl $0
80106210:	6a 00                	push   $0x0
  pushl $81
80106212:	6a 51                	push   $0x51
  jmp alltraps
80106214:	e9 ae f5 ff ff       	jmp    801057c7 <alltraps>

80106219 <vector82>:
.globl vector82
vector82:
  pushl $0
80106219:	6a 00                	push   $0x0
  pushl $82
8010621b:	6a 52                	push   $0x52
  jmp alltraps
8010621d:	e9 a5 f5 ff ff       	jmp    801057c7 <alltraps>

80106222 <vector83>:
.globl vector83
vector83:
  pushl $0
80106222:	6a 00                	push   $0x0
  pushl $83
80106224:	6a 53                	push   $0x53
  jmp alltraps
80106226:	e9 9c f5 ff ff       	jmp    801057c7 <alltraps>

8010622b <vector84>:
.globl vector84
vector84:
  pushl $0
8010622b:	6a 00                	push   $0x0
  pushl $84
8010622d:	6a 54                	push   $0x54
  jmp alltraps
8010622f:	e9 93 f5 ff ff       	jmp    801057c7 <alltraps>

80106234 <vector85>:
.globl vector85
vector85:
  pushl $0
80106234:	6a 00                	push   $0x0
  pushl $85
80106236:	6a 55                	push   $0x55
  jmp alltraps
80106238:	e9 8a f5 ff ff       	jmp    801057c7 <alltraps>

8010623d <vector86>:
.globl vector86
vector86:
  pushl $0
8010623d:	6a 00                	push   $0x0
  pushl $86
8010623f:	6a 56                	push   $0x56
  jmp alltraps
80106241:	e9 81 f5 ff ff       	jmp    801057c7 <alltraps>

80106246 <vector87>:
.globl vector87
vector87:
  pushl $0
80106246:	6a 00                	push   $0x0
  pushl $87
80106248:	6a 57                	push   $0x57
  jmp alltraps
8010624a:	e9 78 f5 ff ff       	jmp    801057c7 <alltraps>

8010624f <vector88>:
.globl vector88
vector88:
  pushl $0
8010624f:	6a 00                	push   $0x0
  pushl $88
80106251:	6a 58                	push   $0x58
  jmp alltraps
80106253:	e9 6f f5 ff ff       	jmp    801057c7 <alltraps>

80106258 <vector89>:
.globl vector89
vector89:
  pushl $0
80106258:	6a 00                	push   $0x0
  pushl $89
8010625a:	6a 59                	push   $0x59
  jmp alltraps
8010625c:	e9 66 f5 ff ff       	jmp    801057c7 <alltraps>

80106261 <vector90>:
.globl vector90
vector90:
  pushl $0
80106261:	6a 00                	push   $0x0
  pushl $90
80106263:	6a 5a                	push   $0x5a
  jmp alltraps
80106265:	e9 5d f5 ff ff       	jmp    801057c7 <alltraps>

8010626a <vector91>:
.globl vector91
vector91:
  pushl $0
8010626a:	6a 00                	push   $0x0
  pushl $91
8010626c:	6a 5b                	push   $0x5b
  jmp alltraps
8010626e:	e9 54 f5 ff ff       	jmp    801057c7 <alltraps>

80106273 <vector92>:
.globl vector92
vector92:
  pushl $0
80106273:	6a 00                	push   $0x0
  pushl $92
80106275:	6a 5c                	push   $0x5c
  jmp alltraps
80106277:	e9 4b f5 ff ff       	jmp    801057c7 <alltraps>

8010627c <vector93>:
.globl vector93
vector93:
  pushl $0
8010627c:	6a 00                	push   $0x0
  pushl $93
8010627e:	6a 5d                	push   $0x5d
  jmp alltraps
80106280:	e9 42 f5 ff ff       	jmp    801057c7 <alltraps>

80106285 <vector94>:
.globl vector94
vector94:
  pushl $0
80106285:	6a 00                	push   $0x0
  pushl $94
80106287:	6a 5e                	push   $0x5e
  jmp alltraps
80106289:	e9 39 f5 ff ff       	jmp    801057c7 <alltraps>

8010628e <vector95>:
.globl vector95
vector95:
  pushl $0
8010628e:	6a 00                	push   $0x0
  pushl $95
80106290:	6a 5f                	push   $0x5f
  jmp alltraps
80106292:	e9 30 f5 ff ff       	jmp    801057c7 <alltraps>

80106297 <vector96>:
.globl vector96
vector96:
  pushl $0
80106297:	6a 00                	push   $0x0
  pushl $96
80106299:	6a 60                	push   $0x60
  jmp alltraps
8010629b:	e9 27 f5 ff ff       	jmp    801057c7 <alltraps>

801062a0 <vector97>:
.globl vector97
vector97:
  pushl $0
801062a0:	6a 00                	push   $0x0
  pushl $97
801062a2:	6a 61                	push   $0x61
  jmp alltraps
801062a4:	e9 1e f5 ff ff       	jmp    801057c7 <alltraps>

801062a9 <vector98>:
.globl vector98
vector98:
  pushl $0
801062a9:	6a 00                	push   $0x0
  pushl $98
801062ab:	6a 62                	push   $0x62
  jmp alltraps
801062ad:	e9 15 f5 ff ff       	jmp    801057c7 <alltraps>

801062b2 <vector99>:
.globl vector99
vector99:
  pushl $0
801062b2:	6a 00                	push   $0x0
  pushl $99
801062b4:	6a 63                	push   $0x63
  jmp alltraps
801062b6:	e9 0c f5 ff ff       	jmp    801057c7 <alltraps>

801062bb <vector100>:
.globl vector100
vector100:
  pushl $0
801062bb:	6a 00                	push   $0x0
  pushl $100
801062bd:	6a 64                	push   $0x64
  jmp alltraps
801062bf:	e9 03 f5 ff ff       	jmp    801057c7 <alltraps>

801062c4 <vector101>:
.globl vector101
vector101:
  pushl $0
801062c4:	6a 00                	push   $0x0
  pushl $101
801062c6:	6a 65                	push   $0x65
  jmp alltraps
801062c8:	e9 fa f4 ff ff       	jmp    801057c7 <alltraps>

801062cd <vector102>:
.globl vector102
vector102:
  pushl $0
801062cd:	6a 00                	push   $0x0
  pushl $102
801062cf:	6a 66                	push   $0x66
  jmp alltraps
801062d1:	e9 f1 f4 ff ff       	jmp    801057c7 <alltraps>

801062d6 <vector103>:
.globl vector103
vector103:
  pushl $0
801062d6:	6a 00                	push   $0x0
  pushl $103
801062d8:	6a 67                	push   $0x67
  jmp alltraps
801062da:	e9 e8 f4 ff ff       	jmp    801057c7 <alltraps>

801062df <vector104>:
.globl vector104
vector104:
  pushl $0
801062df:	6a 00                	push   $0x0
  pushl $104
801062e1:	6a 68                	push   $0x68
  jmp alltraps
801062e3:	e9 df f4 ff ff       	jmp    801057c7 <alltraps>

801062e8 <vector105>:
.globl vector105
vector105:
  pushl $0
801062e8:	6a 00                	push   $0x0
  pushl $105
801062ea:	6a 69                	push   $0x69
  jmp alltraps
801062ec:	e9 d6 f4 ff ff       	jmp    801057c7 <alltraps>

801062f1 <vector106>:
.globl vector106
vector106:
  pushl $0
801062f1:	6a 00                	push   $0x0
  pushl $106
801062f3:	6a 6a                	push   $0x6a
  jmp alltraps
801062f5:	e9 cd f4 ff ff       	jmp    801057c7 <alltraps>

801062fa <vector107>:
.globl vector107
vector107:
  pushl $0
801062fa:	6a 00                	push   $0x0
  pushl $107
801062fc:	6a 6b                	push   $0x6b
  jmp alltraps
801062fe:	e9 c4 f4 ff ff       	jmp    801057c7 <alltraps>

80106303 <vector108>:
.globl vector108
vector108:
  pushl $0
80106303:	6a 00                	push   $0x0
  pushl $108
80106305:	6a 6c                	push   $0x6c
  jmp alltraps
80106307:	e9 bb f4 ff ff       	jmp    801057c7 <alltraps>

8010630c <vector109>:
.globl vector109
vector109:
  pushl $0
8010630c:	6a 00                	push   $0x0
  pushl $109
8010630e:	6a 6d                	push   $0x6d
  jmp alltraps
80106310:	e9 b2 f4 ff ff       	jmp    801057c7 <alltraps>

80106315 <vector110>:
.globl vector110
vector110:
  pushl $0
80106315:	6a 00                	push   $0x0
  pushl $110
80106317:	6a 6e                	push   $0x6e
  jmp alltraps
80106319:	e9 a9 f4 ff ff       	jmp    801057c7 <alltraps>

8010631e <vector111>:
.globl vector111
vector111:
  pushl $0
8010631e:	6a 00                	push   $0x0
  pushl $111
80106320:	6a 6f                	push   $0x6f
  jmp alltraps
80106322:	e9 a0 f4 ff ff       	jmp    801057c7 <alltraps>

80106327 <vector112>:
.globl vector112
vector112:
  pushl $0
80106327:	6a 00                	push   $0x0
  pushl $112
80106329:	6a 70                	push   $0x70
  jmp alltraps
8010632b:	e9 97 f4 ff ff       	jmp    801057c7 <alltraps>

80106330 <vector113>:
.globl vector113
vector113:
  pushl $0
80106330:	6a 00                	push   $0x0
  pushl $113
80106332:	6a 71                	push   $0x71
  jmp alltraps
80106334:	e9 8e f4 ff ff       	jmp    801057c7 <alltraps>

80106339 <vector114>:
.globl vector114
vector114:
  pushl $0
80106339:	6a 00                	push   $0x0
  pushl $114
8010633b:	6a 72                	push   $0x72
  jmp alltraps
8010633d:	e9 85 f4 ff ff       	jmp    801057c7 <alltraps>

80106342 <vector115>:
.globl vector115
vector115:
  pushl $0
80106342:	6a 00                	push   $0x0
  pushl $115
80106344:	6a 73                	push   $0x73
  jmp alltraps
80106346:	e9 7c f4 ff ff       	jmp    801057c7 <alltraps>

8010634b <vector116>:
.globl vector116
vector116:
  pushl $0
8010634b:	6a 00                	push   $0x0
  pushl $116
8010634d:	6a 74                	push   $0x74
  jmp alltraps
8010634f:	e9 73 f4 ff ff       	jmp    801057c7 <alltraps>

80106354 <vector117>:
.globl vector117
vector117:
  pushl $0
80106354:	6a 00                	push   $0x0
  pushl $117
80106356:	6a 75                	push   $0x75
  jmp alltraps
80106358:	e9 6a f4 ff ff       	jmp    801057c7 <alltraps>

8010635d <vector118>:
.globl vector118
vector118:
  pushl $0
8010635d:	6a 00                	push   $0x0
  pushl $118
8010635f:	6a 76                	push   $0x76
  jmp alltraps
80106361:	e9 61 f4 ff ff       	jmp    801057c7 <alltraps>

80106366 <vector119>:
.globl vector119
vector119:
  pushl $0
80106366:	6a 00                	push   $0x0
  pushl $119
80106368:	6a 77                	push   $0x77
  jmp alltraps
8010636a:	e9 58 f4 ff ff       	jmp    801057c7 <alltraps>

8010636f <vector120>:
.globl vector120
vector120:
  pushl $0
8010636f:	6a 00                	push   $0x0
  pushl $120
80106371:	6a 78                	push   $0x78
  jmp alltraps
80106373:	e9 4f f4 ff ff       	jmp    801057c7 <alltraps>

80106378 <vector121>:
.globl vector121
vector121:
  pushl $0
80106378:	6a 00                	push   $0x0
  pushl $121
8010637a:	6a 79                	push   $0x79
  jmp alltraps
8010637c:	e9 46 f4 ff ff       	jmp    801057c7 <alltraps>

80106381 <vector122>:
.globl vector122
vector122:
  pushl $0
80106381:	6a 00                	push   $0x0
  pushl $122
80106383:	6a 7a                	push   $0x7a
  jmp alltraps
80106385:	e9 3d f4 ff ff       	jmp    801057c7 <alltraps>

8010638a <vector123>:
.globl vector123
vector123:
  pushl $0
8010638a:	6a 00                	push   $0x0
  pushl $123
8010638c:	6a 7b                	push   $0x7b
  jmp alltraps
8010638e:	e9 34 f4 ff ff       	jmp    801057c7 <alltraps>

80106393 <vector124>:
.globl vector124
vector124:
  pushl $0
80106393:	6a 00                	push   $0x0
  pushl $124
80106395:	6a 7c                	push   $0x7c
  jmp alltraps
80106397:	e9 2b f4 ff ff       	jmp    801057c7 <alltraps>

8010639c <vector125>:
.globl vector125
vector125:
  pushl $0
8010639c:	6a 00                	push   $0x0
  pushl $125
8010639e:	6a 7d                	push   $0x7d
  jmp alltraps
801063a0:	e9 22 f4 ff ff       	jmp    801057c7 <alltraps>

801063a5 <vector126>:
.globl vector126
vector126:
  pushl $0
801063a5:	6a 00                	push   $0x0
  pushl $126
801063a7:	6a 7e                	push   $0x7e
  jmp alltraps
801063a9:	e9 19 f4 ff ff       	jmp    801057c7 <alltraps>

801063ae <vector127>:
.globl vector127
vector127:
  pushl $0
801063ae:	6a 00                	push   $0x0
  pushl $127
801063b0:	6a 7f                	push   $0x7f
  jmp alltraps
801063b2:	e9 10 f4 ff ff       	jmp    801057c7 <alltraps>

801063b7 <vector128>:
.globl vector128
vector128:
  pushl $0
801063b7:	6a 00                	push   $0x0
  pushl $128
801063b9:	68 80 00 00 00       	push   $0x80
  jmp alltraps
801063be:	e9 04 f4 ff ff       	jmp    801057c7 <alltraps>

801063c3 <vector129>:
.globl vector129
vector129:
  pushl $0
801063c3:	6a 00                	push   $0x0
  pushl $129
801063c5:	68 81 00 00 00       	push   $0x81
  jmp alltraps
801063ca:	e9 f8 f3 ff ff       	jmp    801057c7 <alltraps>

801063cf <vector130>:
.globl vector130
vector130:
  pushl $0
801063cf:	6a 00                	push   $0x0
  pushl $130
801063d1:	68 82 00 00 00       	push   $0x82
  jmp alltraps
801063d6:	e9 ec f3 ff ff       	jmp    801057c7 <alltraps>

801063db <vector131>:
.globl vector131
vector131:
  pushl $0
801063db:	6a 00                	push   $0x0
  pushl $131
801063dd:	68 83 00 00 00       	push   $0x83
  jmp alltraps
801063e2:	e9 e0 f3 ff ff       	jmp    801057c7 <alltraps>

801063e7 <vector132>:
.globl vector132
vector132:
  pushl $0
801063e7:	6a 00                	push   $0x0
  pushl $132
801063e9:	68 84 00 00 00       	push   $0x84
  jmp alltraps
801063ee:	e9 d4 f3 ff ff       	jmp    801057c7 <alltraps>

801063f3 <vector133>:
.globl vector133
vector133:
  pushl $0
801063f3:	6a 00                	push   $0x0
  pushl $133
801063f5:	68 85 00 00 00       	push   $0x85
  jmp alltraps
801063fa:	e9 c8 f3 ff ff       	jmp    801057c7 <alltraps>

801063ff <vector134>:
.globl vector134
vector134:
  pushl $0
801063ff:	6a 00                	push   $0x0
  pushl $134
80106401:	68 86 00 00 00       	push   $0x86
  jmp alltraps
80106406:	e9 bc f3 ff ff       	jmp    801057c7 <alltraps>

8010640b <vector135>:
.globl vector135
vector135:
  pushl $0
8010640b:	6a 00                	push   $0x0
  pushl $135
8010640d:	68 87 00 00 00       	push   $0x87
  jmp alltraps
80106412:	e9 b0 f3 ff ff       	jmp    801057c7 <alltraps>

80106417 <vector136>:
.globl vector136
vector136:
  pushl $0
80106417:	6a 00                	push   $0x0
  pushl $136
80106419:	68 88 00 00 00       	push   $0x88
  jmp alltraps
8010641e:	e9 a4 f3 ff ff       	jmp    801057c7 <alltraps>

80106423 <vector137>:
.globl vector137
vector137:
  pushl $0
80106423:	6a 00                	push   $0x0
  pushl $137
80106425:	68 89 00 00 00       	push   $0x89
  jmp alltraps
8010642a:	e9 98 f3 ff ff       	jmp    801057c7 <alltraps>

8010642f <vector138>:
.globl vector138
vector138:
  pushl $0
8010642f:	6a 00                	push   $0x0
  pushl $138
80106431:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
80106436:	e9 8c f3 ff ff       	jmp    801057c7 <alltraps>

8010643b <vector139>:
.globl vector139
vector139:
  pushl $0
8010643b:	6a 00                	push   $0x0
  pushl $139
8010643d:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
80106442:	e9 80 f3 ff ff       	jmp    801057c7 <alltraps>

80106447 <vector140>:
.globl vector140
vector140:
  pushl $0
80106447:	6a 00                	push   $0x0
  pushl $140
80106449:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
8010644e:	e9 74 f3 ff ff       	jmp    801057c7 <alltraps>

80106453 <vector141>:
.globl vector141
vector141:
  pushl $0
80106453:	6a 00                	push   $0x0
  pushl $141
80106455:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
8010645a:	e9 68 f3 ff ff       	jmp    801057c7 <alltraps>

8010645f <vector142>:
.globl vector142
vector142:
  pushl $0
8010645f:	6a 00                	push   $0x0
  pushl $142
80106461:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
80106466:	e9 5c f3 ff ff       	jmp    801057c7 <alltraps>

8010646b <vector143>:
.globl vector143
vector143:
  pushl $0
8010646b:	6a 00                	push   $0x0
  pushl $143
8010646d:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
80106472:	e9 50 f3 ff ff       	jmp    801057c7 <alltraps>

80106477 <vector144>:
.globl vector144
vector144:
  pushl $0
80106477:	6a 00                	push   $0x0
  pushl $144
80106479:	68 90 00 00 00       	push   $0x90
  jmp alltraps
8010647e:	e9 44 f3 ff ff       	jmp    801057c7 <alltraps>

80106483 <vector145>:
.globl vector145
vector145:
  pushl $0
80106483:	6a 00                	push   $0x0
  pushl $145
80106485:	68 91 00 00 00       	push   $0x91
  jmp alltraps
8010648a:	e9 38 f3 ff ff       	jmp    801057c7 <alltraps>

8010648f <vector146>:
.globl vector146
vector146:
  pushl $0
8010648f:	6a 00                	push   $0x0
  pushl $146
80106491:	68 92 00 00 00       	push   $0x92
  jmp alltraps
80106496:	e9 2c f3 ff ff       	jmp    801057c7 <alltraps>

8010649b <vector147>:
.globl vector147
vector147:
  pushl $0
8010649b:	6a 00                	push   $0x0
  pushl $147
8010649d:	68 93 00 00 00       	push   $0x93
  jmp alltraps
801064a2:	e9 20 f3 ff ff       	jmp    801057c7 <alltraps>

801064a7 <vector148>:
.globl vector148
vector148:
  pushl $0
801064a7:	6a 00                	push   $0x0
  pushl $148
801064a9:	68 94 00 00 00       	push   $0x94
  jmp alltraps
801064ae:	e9 14 f3 ff ff       	jmp    801057c7 <alltraps>

801064b3 <vector149>:
.globl vector149
vector149:
  pushl $0
801064b3:	6a 00                	push   $0x0
  pushl $149
801064b5:	68 95 00 00 00       	push   $0x95
  jmp alltraps
801064ba:	e9 08 f3 ff ff       	jmp    801057c7 <alltraps>

801064bf <vector150>:
.globl vector150
vector150:
  pushl $0
801064bf:	6a 00                	push   $0x0
  pushl $150
801064c1:	68 96 00 00 00       	push   $0x96
  jmp alltraps
801064c6:	e9 fc f2 ff ff       	jmp    801057c7 <alltraps>

801064cb <vector151>:
.globl vector151
vector151:
  pushl $0
801064cb:	6a 00                	push   $0x0
  pushl $151
801064cd:	68 97 00 00 00       	push   $0x97
  jmp alltraps
801064d2:	e9 f0 f2 ff ff       	jmp    801057c7 <alltraps>

801064d7 <vector152>:
.globl vector152
vector152:
  pushl $0
801064d7:	6a 00                	push   $0x0
  pushl $152
801064d9:	68 98 00 00 00       	push   $0x98
  jmp alltraps
801064de:	e9 e4 f2 ff ff       	jmp    801057c7 <alltraps>

801064e3 <vector153>:
.globl vector153
vector153:
  pushl $0
801064e3:	6a 00                	push   $0x0
  pushl $153
801064e5:	68 99 00 00 00       	push   $0x99
  jmp alltraps
801064ea:	e9 d8 f2 ff ff       	jmp    801057c7 <alltraps>

801064ef <vector154>:
.globl vector154
vector154:
  pushl $0
801064ef:	6a 00                	push   $0x0
  pushl $154
801064f1:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
801064f6:	e9 cc f2 ff ff       	jmp    801057c7 <alltraps>

801064fb <vector155>:
.globl vector155
vector155:
  pushl $0
801064fb:	6a 00                	push   $0x0
  pushl $155
801064fd:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
80106502:	e9 c0 f2 ff ff       	jmp    801057c7 <alltraps>

80106507 <vector156>:
.globl vector156
vector156:
  pushl $0
80106507:	6a 00                	push   $0x0
  pushl $156
80106509:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
8010650e:	e9 b4 f2 ff ff       	jmp    801057c7 <alltraps>

80106513 <vector157>:
.globl vector157
vector157:
  pushl $0
80106513:	6a 00                	push   $0x0
  pushl $157
80106515:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
8010651a:	e9 a8 f2 ff ff       	jmp    801057c7 <alltraps>

8010651f <vector158>:
.globl vector158
vector158:
  pushl $0
8010651f:	6a 00                	push   $0x0
  pushl $158
80106521:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
80106526:	e9 9c f2 ff ff       	jmp    801057c7 <alltraps>

8010652b <vector159>:
.globl vector159
vector159:
  pushl $0
8010652b:	6a 00                	push   $0x0
  pushl $159
8010652d:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
80106532:	e9 90 f2 ff ff       	jmp    801057c7 <alltraps>

80106537 <vector160>:
.globl vector160
vector160:
  pushl $0
80106537:	6a 00                	push   $0x0
  pushl $160
80106539:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
8010653e:	e9 84 f2 ff ff       	jmp    801057c7 <alltraps>

80106543 <vector161>:
.globl vector161
vector161:
  pushl $0
80106543:	6a 00                	push   $0x0
  pushl $161
80106545:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
8010654a:	e9 78 f2 ff ff       	jmp    801057c7 <alltraps>

8010654f <vector162>:
.globl vector162
vector162:
  pushl $0
8010654f:	6a 00                	push   $0x0
  pushl $162
80106551:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
80106556:	e9 6c f2 ff ff       	jmp    801057c7 <alltraps>

8010655b <vector163>:
.globl vector163
vector163:
  pushl $0
8010655b:	6a 00                	push   $0x0
  pushl $163
8010655d:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
80106562:	e9 60 f2 ff ff       	jmp    801057c7 <alltraps>

80106567 <vector164>:
.globl vector164
vector164:
  pushl $0
80106567:	6a 00                	push   $0x0
  pushl $164
80106569:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
8010656e:	e9 54 f2 ff ff       	jmp    801057c7 <alltraps>

80106573 <vector165>:
.globl vector165
vector165:
  pushl $0
80106573:	6a 00                	push   $0x0
  pushl $165
80106575:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
8010657a:	e9 48 f2 ff ff       	jmp    801057c7 <alltraps>

8010657f <vector166>:
.globl vector166
vector166:
  pushl $0
8010657f:	6a 00                	push   $0x0
  pushl $166
80106581:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
80106586:	e9 3c f2 ff ff       	jmp    801057c7 <alltraps>

8010658b <vector167>:
.globl vector167
vector167:
  pushl $0
8010658b:	6a 00                	push   $0x0
  pushl $167
8010658d:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
80106592:	e9 30 f2 ff ff       	jmp    801057c7 <alltraps>

80106597 <vector168>:
.globl vector168
vector168:
  pushl $0
80106597:	6a 00                	push   $0x0
  pushl $168
80106599:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
8010659e:	e9 24 f2 ff ff       	jmp    801057c7 <alltraps>

801065a3 <vector169>:
.globl vector169
vector169:
  pushl $0
801065a3:	6a 00                	push   $0x0
  pushl $169
801065a5:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
801065aa:	e9 18 f2 ff ff       	jmp    801057c7 <alltraps>

801065af <vector170>:
.globl vector170
vector170:
  pushl $0
801065af:	6a 00                	push   $0x0
  pushl $170
801065b1:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
801065b6:	e9 0c f2 ff ff       	jmp    801057c7 <alltraps>

801065bb <vector171>:
.globl vector171
vector171:
  pushl $0
801065bb:	6a 00                	push   $0x0
  pushl $171
801065bd:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
801065c2:	e9 00 f2 ff ff       	jmp    801057c7 <alltraps>

801065c7 <vector172>:
.globl vector172
vector172:
  pushl $0
801065c7:	6a 00                	push   $0x0
  pushl $172
801065c9:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
801065ce:	e9 f4 f1 ff ff       	jmp    801057c7 <alltraps>

801065d3 <vector173>:
.globl vector173
vector173:
  pushl $0
801065d3:	6a 00                	push   $0x0
  pushl $173
801065d5:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
801065da:	e9 e8 f1 ff ff       	jmp    801057c7 <alltraps>

801065df <vector174>:
.globl vector174
vector174:
  pushl $0
801065df:	6a 00                	push   $0x0
  pushl $174
801065e1:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
801065e6:	e9 dc f1 ff ff       	jmp    801057c7 <alltraps>

801065eb <vector175>:
.globl vector175
vector175:
  pushl $0
801065eb:	6a 00                	push   $0x0
  pushl $175
801065ed:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
801065f2:	e9 d0 f1 ff ff       	jmp    801057c7 <alltraps>

801065f7 <vector176>:
.globl vector176
vector176:
  pushl $0
801065f7:	6a 00                	push   $0x0
  pushl $176
801065f9:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
801065fe:	e9 c4 f1 ff ff       	jmp    801057c7 <alltraps>

80106603 <vector177>:
.globl vector177
vector177:
  pushl $0
80106603:	6a 00                	push   $0x0
  pushl $177
80106605:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
8010660a:	e9 b8 f1 ff ff       	jmp    801057c7 <alltraps>

8010660f <vector178>:
.globl vector178
vector178:
  pushl $0
8010660f:	6a 00                	push   $0x0
  pushl $178
80106611:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
80106616:	e9 ac f1 ff ff       	jmp    801057c7 <alltraps>

8010661b <vector179>:
.globl vector179
vector179:
  pushl $0
8010661b:	6a 00                	push   $0x0
  pushl $179
8010661d:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
80106622:	e9 a0 f1 ff ff       	jmp    801057c7 <alltraps>

80106627 <vector180>:
.globl vector180
vector180:
  pushl $0
80106627:	6a 00                	push   $0x0
  pushl $180
80106629:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
8010662e:	e9 94 f1 ff ff       	jmp    801057c7 <alltraps>

80106633 <vector181>:
.globl vector181
vector181:
  pushl $0
80106633:	6a 00                	push   $0x0
  pushl $181
80106635:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
8010663a:	e9 88 f1 ff ff       	jmp    801057c7 <alltraps>

8010663f <vector182>:
.globl vector182
vector182:
  pushl $0
8010663f:	6a 00                	push   $0x0
  pushl $182
80106641:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
80106646:	e9 7c f1 ff ff       	jmp    801057c7 <alltraps>

8010664b <vector183>:
.globl vector183
vector183:
  pushl $0
8010664b:	6a 00                	push   $0x0
  pushl $183
8010664d:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
80106652:	e9 70 f1 ff ff       	jmp    801057c7 <alltraps>

80106657 <vector184>:
.globl vector184
vector184:
  pushl $0
80106657:	6a 00                	push   $0x0
  pushl $184
80106659:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
8010665e:	e9 64 f1 ff ff       	jmp    801057c7 <alltraps>

80106663 <vector185>:
.globl vector185
vector185:
  pushl $0
80106663:	6a 00                	push   $0x0
  pushl $185
80106665:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
8010666a:	e9 58 f1 ff ff       	jmp    801057c7 <alltraps>

8010666f <vector186>:
.globl vector186
vector186:
  pushl $0
8010666f:	6a 00                	push   $0x0
  pushl $186
80106671:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
80106676:	e9 4c f1 ff ff       	jmp    801057c7 <alltraps>

8010667b <vector187>:
.globl vector187
vector187:
  pushl $0
8010667b:	6a 00                	push   $0x0
  pushl $187
8010667d:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
80106682:	e9 40 f1 ff ff       	jmp    801057c7 <alltraps>

80106687 <vector188>:
.globl vector188
vector188:
  pushl $0
80106687:	6a 00                	push   $0x0
  pushl $188
80106689:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
8010668e:	e9 34 f1 ff ff       	jmp    801057c7 <alltraps>

80106693 <vector189>:
.globl vector189
vector189:
  pushl $0
80106693:	6a 00                	push   $0x0
  pushl $189
80106695:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
8010669a:	e9 28 f1 ff ff       	jmp    801057c7 <alltraps>

8010669f <vector190>:
.globl vector190
vector190:
  pushl $0
8010669f:	6a 00                	push   $0x0
  pushl $190
801066a1:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
801066a6:	e9 1c f1 ff ff       	jmp    801057c7 <alltraps>

801066ab <vector191>:
.globl vector191
vector191:
  pushl $0
801066ab:	6a 00                	push   $0x0
  pushl $191
801066ad:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
801066b2:	e9 10 f1 ff ff       	jmp    801057c7 <alltraps>

801066b7 <vector192>:
.globl vector192
vector192:
  pushl $0
801066b7:	6a 00                	push   $0x0
  pushl $192
801066b9:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
801066be:	e9 04 f1 ff ff       	jmp    801057c7 <alltraps>

801066c3 <vector193>:
.globl vector193
vector193:
  pushl $0
801066c3:	6a 00                	push   $0x0
  pushl $193
801066c5:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
801066ca:	e9 f8 f0 ff ff       	jmp    801057c7 <alltraps>

801066cf <vector194>:
.globl vector194
vector194:
  pushl $0
801066cf:	6a 00                	push   $0x0
  pushl $194
801066d1:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
801066d6:	e9 ec f0 ff ff       	jmp    801057c7 <alltraps>

801066db <vector195>:
.globl vector195
vector195:
  pushl $0
801066db:	6a 00                	push   $0x0
  pushl $195
801066dd:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
801066e2:	e9 e0 f0 ff ff       	jmp    801057c7 <alltraps>

801066e7 <vector196>:
.globl vector196
vector196:
  pushl $0
801066e7:	6a 00                	push   $0x0
  pushl $196
801066e9:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
801066ee:	e9 d4 f0 ff ff       	jmp    801057c7 <alltraps>

801066f3 <vector197>:
.globl vector197
vector197:
  pushl $0
801066f3:	6a 00                	push   $0x0
  pushl $197
801066f5:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
801066fa:	e9 c8 f0 ff ff       	jmp    801057c7 <alltraps>

801066ff <vector198>:
.globl vector198
vector198:
  pushl $0
801066ff:	6a 00                	push   $0x0
  pushl $198
80106701:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
80106706:	e9 bc f0 ff ff       	jmp    801057c7 <alltraps>

8010670b <vector199>:
.globl vector199
vector199:
  pushl $0
8010670b:	6a 00                	push   $0x0
  pushl $199
8010670d:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
80106712:	e9 b0 f0 ff ff       	jmp    801057c7 <alltraps>

80106717 <vector200>:
.globl vector200
vector200:
  pushl $0
80106717:	6a 00                	push   $0x0
  pushl $200
80106719:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
8010671e:	e9 a4 f0 ff ff       	jmp    801057c7 <alltraps>

80106723 <vector201>:
.globl vector201
vector201:
  pushl $0
80106723:	6a 00                	push   $0x0
  pushl $201
80106725:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
8010672a:	e9 98 f0 ff ff       	jmp    801057c7 <alltraps>

8010672f <vector202>:
.globl vector202
vector202:
  pushl $0
8010672f:	6a 00                	push   $0x0
  pushl $202
80106731:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
80106736:	e9 8c f0 ff ff       	jmp    801057c7 <alltraps>

8010673b <vector203>:
.globl vector203
vector203:
  pushl $0
8010673b:	6a 00                	push   $0x0
  pushl $203
8010673d:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
80106742:	e9 80 f0 ff ff       	jmp    801057c7 <alltraps>

80106747 <vector204>:
.globl vector204
vector204:
  pushl $0
80106747:	6a 00                	push   $0x0
  pushl $204
80106749:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
8010674e:	e9 74 f0 ff ff       	jmp    801057c7 <alltraps>

80106753 <vector205>:
.globl vector205
vector205:
  pushl $0
80106753:	6a 00                	push   $0x0
  pushl $205
80106755:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
8010675a:	e9 68 f0 ff ff       	jmp    801057c7 <alltraps>

8010675f <vector206>:
.globl vector206
vector206:
  pushl $0
8010675f:	6a 00                	push   $0x0
  pushl $206
80106761:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
80106766:	e9 5c f0 ff ff       	jmp    801057c7 <alltraps>

8010676b <vector207>:
.globl vector207
vector207:
  pushl $0
8010676b:	6a 00                	push   $0x0
  pushl $207
8010676d:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
80106772:	e9 50 f0 ff ff       	jmp    801057c7 <alltraps>

80106777 <vector208>:
.globl vector208
vector208:
  pushl $0
80106777:	6a 00                	push   $0x0
  pushl $208
80106779:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
8010677e:	e9 44 f0 ff ff       	jmp    801057c7 <alltraps>

80106783 <vector209>:
.globl vector209
vector209:
  pushl $0
80106783:	6a 00                	push   $0x0
  pushl $209
80106785:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
8010678a:	e9 38 f0 ff ff       	jmp    801057c7 <alltraps>

8010678f <vector210>:
.globl vector210
vector210:
  pushl $0
8010678f:	6a 00                	push   $0x0
  pushl $210
80106791:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
80106796:	e9 2c f0 ff ff       	jmp    801057c7 <alltraps>

8010679b <vector211>:
.globl vector211
vector211:
  pushl $0
8010679b:	6a 00                	push   $0x0
  pushl $211
8010679d:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
801067a2:	e9 20 f0 ff ff       	jmp    801057c7 <alltraps>

801067a7 <vector212>:
.globl vector212
vector212:
  pushl $0
801067a7:	6a 00                	push   $0x0
  pushl $212
801067a9:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
801067ae:	e9 14 f0 ff ff       	jmp    801057c7 <alltraps>

801067b3 <vector213>:
.globl vector213
vector213:
  pushl $0
801067b3:	6a 00                	push   $0x0
  pushl $213
801067b5:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
801067ba:	e9 08 f0 ff ff       	jmp    801057c7 <alltraps>

801067bf <vector214>:
.globl vector214
vector214:
  pushl $0
801067bf:	6a 00                	push   $0x0
  pushl $214
801067c1:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
801067c6:	e9 fc ef ff ff       	jmp    801057c7 <alltraps>

801067cb <vector215>:
.globl vector215
vector215:
  pushl $0
801067cb:	6a 00                	push   $0x0
  pushl $215
801067cd:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
801067d2:	e9 f0 ef ff ff       	jmp    801057c7 <alltraps>

801067d7 <vector216>:
.globl vector216
vector216:
  pushl $0
801067d7:	6a 00                	push   $0x0
  pushl $216
801067d9:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
801067de:	e9 e4 ef ff ff       	jmp    801057c7 <alltraps>

801067e3 <vector217>:
.globl vector217
vector217:
  pushl $0
801067e3:	6a 00                	push   $0x0
  pushl $217
801067e5:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
801067ea:	e9 d8 ef ff ff       	jmp    801057c7 <alltraps>

801067ef <vector218>:
.globl vector218
vector218:
  pushl $0
801067ef:	6a 00                	push   $0x0
  pushl $218
801067f1:	68 da 00 00 00       	push   $0xda
  jmp alltraps
801067f6:	e9 cc ef ff ff       	jmp    801057c7 <alltraps>

801067fb <vector219>:
.globl vector219
vector219:
  pushl $0
801067fb:	6a 00                	push   $0x0
  pushl $219
801067fd:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
80106802:	e9 c0 ef ff ff       	jmp    801057c7 <alltraps>

80106807 <vector220>:
.globl vector220
vector220:
  pushl $0
80106807:	6a 00                	push   $0x0
  pushl $220
80106809:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
8010680e:	e9 b4 ef ff ff       	jmp    801057c7 <alltraps>

80106813 <vector221>:
.globl vector221
vector221:
  pushl $0
80106813:	6a 00                	push   $0x0
  pushl $221
80106815:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
8010681a:	e9 a8 ef ff ff       	jmp    801057c7 <alltraps>

8010681f <vector222>:
.globl vector222
vector222:
  pushl $0
8010681f:	6a 00                	push   $0x0
  pushl $222
80106821:	68 de 00 00 00       	push   $0xde
  jmp alltraps
80106826:	e9 9c ef ff ff       	jmp    801057c7 <alltraps>

8010682b <vector223>:
.globl vector223
vector223:
  pushl $0
8010682b:	6a 00                	push   $0x0
  pushl $223
8010682d:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
80106832:	e9 90 ef ff ff       	jmp    801057c7 <alltraps>

80106837 <vector224>:
.globl vector224
vector224:
  pushl $0
80106837:	6a 00                	push   $0x0
  pushl $224
80106839:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
8010683e:	e9 84 ef ff ff       	jmp    801057c7 <alltraps>

80106843 <vector225>:
.globl vector225
vector225:
  pushl $0
80106843:	6a 00                	push   $0x0
  pushl $225
80106845:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
8010684a:	e9 78 ef ff ff       	jmp    801057c7 <alltraps>

8010684f <vector226>:
.globl vector226
vector226:
  pushl $0
8010684f:	6a 00                	push   $0x0
  pushl $226
80106851:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
80106856:	e9 6c ef ff ff       	jmp    801057c7 <alltraps>

8010685b <vector227>:
.globl vector227
vector227:
  pushl $0
8010685b:	6a 00                	push   $0x0
  pushl $227
8010685d:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
80106862:	e9 60 ef ff ff       	jmp    801057c7 <alltraps>

80106867 <vector228>:
.globl vector228
vector228:
  pushl $0
80106867:	6a 00                	push   $0x0
  pushl $228
80106869:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
8010686e:	e9 54 ef ff ff       	jmp    801057c7 <alltraps>

80106873 <vector229>:
.globl vector229
vector229:
  pushl $0
80106873:	6a 00                	push   $0x0
  pushl $229
80106875:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
8010687a:	e9 48 ef ff ff       	jmp    801057c7 <alltraps>

8010687f <vector230>:
.globl vector230
vector230:
  pushl $0
8010687f:	6a 00                	push   $0x0
  pushl $230
80106881:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
80106886:	e9 3c ef ff ff       	jmp    801057c7 <alltraps>

8010688b <vector231>:
.globl vector231
vector231:
  pushl $0
8010688b:	6a 00                	push   $0x0
  pushl $231
8010688d:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
80106892:	e9 30 ef ff ff       	jmp    801057c7 <alltraps>

80106897 <vector232>:
.globl vector232
vector232:
  pushl $0
80106897:	6a 00                	push   $0x0
  pushl $232
80106899:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
8010689e:	e9 24 ef ff ff       	jmp    801057c7 <alltraps>

801068a3 <vector233>:
.globl vector233
vector233:
  pushl $0
801068a3:	6a 00                	push   $0x0
  pushl $233
801068a5:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
801068aa:	e9 18 ef ff ff       	jmp    801057c7 <alltraps>

801068af <vector234>:
.globl vector234
vector234:
  pushl $0
801068af:	6a 00                	push   $0x0
  pushl $234
801068b1:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
801068b6:	e9 0c ef ff ff       	jmp    801057c7 <alltraps>

801068bb <vector235>:
.globl vector235
vector235:
  pushl $0
801068bb:	6a 00                	push   $0x0
  pushl $235
801068bd:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
801068c2:	e9 00 ef ff ff       	jmp    801057c7 <alltraps>

801068c7 <vector236>:
.globl vector236
vector236:
  pushl $0
801068c7:	6a 00                	push   $0x0
  pushl $236
801068c9:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
801068ce:	e9 f4 ee ff ff       	jmp    801057c7 <alltraps>

801068d3 <vector237>:
.globl vector237
vector237:
  pushl $0
801068d3:	6a 00                	push   $0x0
  pushl $237
801068d5:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
801068da:	e9 e8 ee ff ff       	jmp    801057c7 <alltraps>

801068df <vector238>:
.globl vector238
vector238:
  pushl $0
801068df:	6a 00                	push   $0x0
  pushl $238
801068e1:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
801068e6:	e9 dc ee ff ff       	jmp    801057c7 <alltraps>

801068eb <vector239>:
.globl vector239
vector239:
  pushl $0
801068eb:	6a 00                	push   $0x0
  pushl $239
801068ed:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
801068f2:	e9 d0 ee ff ff       	jmp    801057c7 <alltraps>

801068f7 <vector240>:
.globl vector240
vector240:
  pushl $0
801068f7:	6a 00                	push   $0x0
  pushl $240
801068f9:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
801068fe:	e9 c4 ee ff ff       	jmp    801057c7 <alltraps>

80106903 <vector241>:
.globl vector241
vector241:
  pushl $0
80106903:	6a 00                	push   $0x0
  pushl $241
80106905:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
8010690a:	e9 b8 ee ff ff       	jmp    801057c7 <alltraps>

8010690f <vector242>:
.globl vector242
vector242:
  pushl $0
8010690f:	6a 00                	push   $0x0
  pushl $242
80106911:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
80106916:	e9 ac ee ff ff       	jmp    801057c7 <alltraps>

8010691b <vector243>:
.globl vector243
vector243:
  pushl $0
8010691b:	6a 00                	push   $0x0
  pushl $243
8010691d:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
80106922:	e9 a0 ee ff ff       	jmp    801057c7 <alltraps>

80106927 <vector244>:
.globl vector244
vector244:
  pushl $0
80106927:	6a 00                	push   $0x0
  pushl $244
80106929:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
8010692e:	e9 94 ee ff ff       	jmp    801057c7 <alltraps>

80106933 <vector245>:
.globl vector245
vector245:
  pushl $0
80106933:	6a 00                	push   $0x0
  pushl $245
80106935:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
8010693a:	e9 88 ee ff ff       	jmp    801057c7 <alltraps>

8010693f <vector246>:
.globl vector246
vector246:
  pushl $0
8010693f:	6a 00                	push   $0x0
  pushl $246
80106941:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
80106946:	e9 7c ee ff ff       	jmp    801057c7 <alltraps>

8010694b <vector247>:
.globl vector247
vector247:
  pushl $0
8010694b:	6a 00                	push   $0x0
  pushl $247
8010694d:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
80106952:	e9 70 ee ff ff       	jmp    801057c7 <alltraps>

80106957 <vector248>:
.globl vector248
vector248:
  pushl $0
80106957:	6a 00                	push   $0x0
  pushl $248
80106959:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
8010695e:	e9 64 ee ff ff       	jmp    801057c7 <alltraps>

80106963 <vector249>:
.globl vector249
vector249:
  pushl $0
80106963:	6a 00                	push   $0x0
  pushl $249
80106965:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
8010696a:	e9 58 ee ff ff       	jmp    801057c7 <alltraps>

8010696f <vector250>:
.globl vector250
vector250:
  pushl $0
8010696f:	6a 00                	push   $0x0
  pushl $250
80106971:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
80106976:	e9 4c ee ff ff       	jmp    801057c7 <alltraps>

8010697b <vector251>:
.globl vector251
vector251:
  pushl $0
8010697b:	6a 00                	push   $0x0
  pushl $251
8010697d:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80106982:	e9 40 ee ff ff       	jmp    801057c7 <alltraps>

80106987 <vector252>:
.globl vector252
vector252:
  pushl $0
80106987:	6a 00                	push   $0x0
  pushl $252
80106989:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
8010698e:	e9 34 ee ff ff       	jmp    801057c7 <alltraps>

80106993 <vector253>:
.globl vector253
vector253:
  pushl $0
80106993:	6a 00                	push   $0x0
  pushl $253
80106995:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
8010699a:	e9 28 ee ff ff       	jmp    801057c7 <alltraps>

8010699f <vector254>:
.globl vector254
vector254:
  pushl $0
8010699f:	6a 00                	push   $0x0
  pushl $254
801069a1:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
801069a6:	e9 1c ee ff ff       	jmp    801057c7 <alltraps>

801069ab <vector255>:
.globl vector255
vector255:
  pushl $0
801069ab:	6a 00                	push   $0x0
  pushl $255
801069ad:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
801069b2:	e9 10 ee ff ff       	jmp    801057c7 <alltraps>
801069b7:	66 90                	xchg   %ax,%ax
801069b9:	66 90                	xchg   %ax,%ax
801069bb:	66 90                	xchg   %ax,%ax
801069bd:	66 90                	xchg   %ax,%ax
801069bf:	90                   	nop

801069c0 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
801069c0:	55                   	push   %ebp
801069c1:	89 e5                	mov    %esp,%ebp
801069c3:	57                   	push   %edi
801069c4:	56                   	push   %esi
801069c5:	53                   	push   %ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
801069c6:	89 d3                	mov    %edx,%ebx
{
801069c8:	89 d7                	mov    %edx,%edi
  pde = &pgdir[PDX(va)];
801069ca:	c1 eb 16             	shr    $0x16,%ebx
801069cd:	8d 34 98             	lea    (%eax,%ebx,4),%esi
{
801069d0:	83 ec 0c             	sub    $0xc,%esp
  if(*pde & PTE_P){
801069d3:	8b 06                	mov    (%esi),%eax
801069d5:	a8 01                	test   $0x1,%al
801069d7:	74 27                	je     80106a00 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
801069d9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801069de:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
801069e4:	c1 ef 0a             	shr    $0xa,%edi
}
801069e7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return &pgtab[PTX(va)];
801069ea:	89 fa                	mov    %edi,%edx
801069ec:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
801069f2:	8d 04 13             	lea    (%ebx,%edx,1),%eax
}
801069f5:	5b                   	pop    %ebx
801069f6:	5e                   	pop    %esi
801069f7:	5f                   	pop    %edi
801069f8:	5d                   	pop    %ebp
801069f9:	c3                   	ret    
801069fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106a00:	85 c9                	test   %ecx,%ecx
80106a02:	74 2c                	je     80106a30 <walkpgdir+0x70>
80106a04:	e8 c7 ba ff ff       	call   801024d0 <kalloc>
80106a09:	85 c0                	test   %eax,%eax
80106a0b:	89 c3                	mov    %eax,%ebx
80106a0d:	74 21                	je     80106a30 <walkpgdir+0x70>
    memset(pgtab, 0, PGSIZE);
80106a0f:	83 ec 04             	sub    $0x4,%esp
80106a12:	68 00 10 00 00       	push   $0x1000
80106a17:	6a 00                	push   $0x0
80106a19:	50                   	push   %eax
80106a1a:	e8 c1 da ff ff       	call   801044e0 <memset>
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80106a1f:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106a25:	83 c4 10             	add    $0x10,%esp
80106a28:	83 c8 07             	or     $0x7,%eax
80106a2b:	89 06                	mov    %eax,(%esi)
80106a2d:	eb b5                	jmp    801069e4 <walkpgdir+0x24>
80106a2f:	90                   	nop
}
80106a30:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
80106a33:	31 c0                	xor    %eax,%eax
}
80106a35:	5b                   	pop    %ebx
80106a36:	5e                   	pop    %esi
80106a37:	5f                   	pop    %edi
80106a38:	5d                   	pop    %ebp
80106a39:	c3                   	ret    
80106a3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106a40 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106a40:	55                   	push   %ebp
80106a41:	89 e5                	mov    %esp,%ebp
80106a43:	57                   	push   %edi
80106a44:	56                   	push   %esi
80106a45:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106a46:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106a4c:	89 c7                	mov    %eax,%edi
  a = PGROUNDUP(newsz);
80106a4e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106a54:	83 ec 1c             	sub    $0x1c,%esp
80106a57:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  for(; a  < oldsz; a += PGSIZE){
80106a5a:	39 d3                	cmp    %edx,%ebx
80106a5c:	73 66                	jae    80106ac4 <deallocuvm.part.0+0x84>
80106a5e:	89 d6                	mov    %edx,%esi
80106a60:	eb 3d                	jmp    80106a9f <deallocuvm.part.0+0x5f>
80106a62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
80106a68:	8b 10                	mov    (%eax),%edx
80106a6a:	f6 c2 01             	test   $0x1,%dl
80106a6d:	74 26                	je     80106a95 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
80106a6f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106a75:	74 58                	je     80106acf <deallocuvm.part.0+0x8f>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
80106a77:	83 ec 0c             	sub    $0xc,%esp
      char *v = P2V(pa);
80106a7a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106a80:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      kfree(v);
80106a83:	52                   	push   %edx
80106a84:	e8 97 b8 ff ff       	call   80102320 <kfree>
      *pte = 0;
80106a89:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106a8c:	83 c4 10             	add    $0x10,%esp
80106a8f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; a  < oldsz; a += PGSIZE){
80106a95:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106a9b:	39 f3                	cmp    %esi,%ebx
80106a9d:	73 25                	jae    80106ac4 <deallocuvm.part.0+0x84>
    pte = walkpgdir(pgdir, (char*)a, 0);
80106a9f:	31 c9                	xor    %ecx,%ecx
80106aa1:	89 da                	mov    %ebx,%edx
80106aa3:	89 f8                	mov    %edi,%eax
80106aa5:	e8 16 ff ff ff       	call   801069c0 <walkpgdir>
    if(!pte)
80106aaa:	85 c0                	test   %eax,%eax
80106aac:	75 ba                	jne    80106a68 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
80106aae:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106ab4:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
80106aba:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106ac0:	39 f3                	cmp    %esi,%ebx
80106ac2:	72 db                	jb     80106a9f <deallocuvm.part.0+0x5f>
    }
  }
  return newsz;
}
80106ac4:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106ac7:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106aca:	5b                   	pop    %ebx
80106acb:	5e                   	pop    %esi
80106acc:	5f                   	pop    %edi
80106acd:	5d                   	pop    %ebp
80106ace:	c3                   	ret    
        panic("kfree");
80106acf:	83 ec 0c             	sub    $0xc,%esp
80106ad2:	68 66 75 10 80       	push   $0x80107566
80106ad7:	e8 b4 98 ff ff       	call   80100390 <panic>
80106adc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106ae0 <seginit>:
{
80106ae0:	55                   	push   %ebp
80106ae1:	89 e5                	mov    %esp,%ebp
80106ae3:	83 ec 18             	sub    $0x18,%esp
  c = &cpus[cpuid()];
80106ae6:	e8 45 cd ff ff       	call   80103830 <cpuid>
80106aeb:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
  pd[0] = size-1;
80106af1:	ba 2f 00 00 00       	mov    $0x2f,%edx
80106af6:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106afa:	c7 80 f8 27 11 80 ff 	movl   $0xffff,-0x7feed808(%eax)
80106b01:	ff 00 00 
80106b04:	c7 80 fc 27 11 80 00 	movl   $0xcf9a00,-0x7feed804(%eax)
80106b0b:	9a cf 00 
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106b0e:	c7 80 00 28 11 80 ff 	movl   $0xffff,-0x7feed800(%eax)
80106b15:	ff 00 00 
80106b18:	c7 80 04 28 11 80 00 	movl   $0xcf9200,-0x7feed7fc(%eax)
80106b1f:	92 cf 00 
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106b22:	c7 80 08 28 11 80 ff 	movl   $0xffff,-0x7feed7f8(%eax)
80106b29:	ff 00 00 
80106b2c:	c7 80 0c 28 11 80 00 	movl   $0xcffa00,-0x7feed7f4(%eax)
80106b33:	fa cf 00 
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106b36:	c7 80 10 28 11 80 ff 	movl   $0xffff,-0x7feed7f0(%eax)
80106b3d:	ff 00 00 
80106b40:	c7 80 14 28 11 80 00 	movl   $0xcff200,-0x7feed7ec(%eax)
80106b47:	f2 cf 00 
  lgdt(c->gdt, sizeof(c->gdt));
80106b4a:	05 f0 27 11 80       	add    $0x801127f0,%eax
  pd[1] = (uint)p;
80106b4f:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106b53:	c1 e8 10             	shr    $0x10,%eax
80106b56:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  asm volatile("lgdt (%0)" : : "r" (pd));
80106b5a:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106b5d:	0f 01 10             	lgdtl  (%eax)
}
80106b60:	c9                   	leave  
80106b61:	c3                   	ret    
80106b62:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106b70 <mappages>:
{
80106b70:	55                   	push   %ebp
80106b71:	89 e5                	mov    %esp,%ebp
80106b73:	57                   	push   %edi
80106b74:	56                   	push   %esi
80106b75:	53                   	push   %ebx
80106b76:	83 ec 1c             	sub    $0x1c,%esp
80106b79:	8b 45 0c             	mov    0xc(%ebp),%eax
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106b7c:	8b 55 10             	mov    0x10(%ebp),%edx
80106b7f:	8b 7d 14             	mov    0x14(%ebp),%edi
  a = (char*)PGROUNDDOWN((uint)va);
80106b82:	89 c3                	mov    %eax,%ebx
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106b84:	8d 44 10 ff          	lea    -0x1(%eax,%edx,1),%eax
  a = (char*)PGROUNDDOWN((uint)va);
80106b88:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106b8e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106b93:	29 df                	sub    %ebx,%edi
80106b95:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    *pte = pa | perm | PTE_P;
80106b98:	8b 45 18             	mov    0x18(%ebp),%eax
80106b9b:	83 c8 01             	or     $0x1,%eax
80106b9e:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106ba1:	eb 1a                	jmp    80106bbd <mappages+0x4d>
80106ba3:	90                   	nop
80106ba4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(*pte & PTE_P)
80106ba8:	f6 00 01             	testb  $0x1,(%eax)
80106bab:	75 3d                	jne    80106bea <mappages+0x7a>
    *pte = pa | perm | PTE_P;
80106bad:	0b 75 e0             	or     -0x20(%ebp),%esi
    if(a == last)
80106bb0:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
    *pte = pa | perm | PTE_P;
80106bb3:	89 30                	mov    %esi,(%eax)
    if(a == last)
80106bb5:	74 29                	je     80106be0 <mappages+0x70>
    a += PGSIZE;
80106bb7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106bbd:	8b 45 08             	mov    0x8(%ebp),%eax
80106bc0:	b9 01 00 00 00       	mov    $0x1,%ecx
80106bc5:	89 da                	mov    %ebx,%edx
80106bc7:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106bca:	e8 f1 fd ff ff       	call   801069c0 <walkpgdir>
80106bcf:	85 c0                	test   %eax,%eax
80106bd1:	75 d5                	jne    80106ba8 <mappages+0x38>
}
80106bd3:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106bd6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106bdb:	5b                   	pop    %ebx
80106bdc:	5e                   	pop    %esi
80106bdd:	5f                   	pop    %edi
80106bde:	5d                   	pop    %ebp
80106bdf:	c3                   	ret    
80106be0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106be3:	31 c0                	xor    %eax,%eax
}
80106be5:	5b                   	pop    %ebx
80106be6:	5e                   	pop    %esi
80106be7:	5f                   	pop    %edi
80106be8:	5d                   	pop    %ebp
80106be9:	c3                   	ret    
      panic("remap");
80106bea:	83 ec 0c             	sub    $0xc,%esp
80106bed:	68 48 7c 10 80       	push   $0x80107c48
80106bf2:	e8 99 97 ff ff       	call   80100390 <panic>
80106bf7:	89 f6                	mov    %esi,%esi
80106bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106c00 <switchkvm>:
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106c00:	a1 a4 5d 11 80       	mov    0x80115da4,%eax
{
80106c05:	55                   	push   %ebp
80106c06:	89 e5                	mov    %esp,%ebp
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106c08:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106c0d:	0f 22 d8             	mov    %eax,%cr3
}
80106c10:	5d                   	pop    %ebp
80106c11:	c3                   	ret    
80106c12:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106c20 <switchuvm>:
{
80106c20:	55                   	push   %ebp
80106c21:	89 e5                	mov    %esp,%ebp
80106c23:	57                   	push   %edi
80106c24:	56                   	push   %esi
80106c25:	53                   	push   %ebx
80106c26:	83 ec 1c             	sub    $0x1c,%esp
80106c29:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(p == 0)
80106c2c:	85 db                	test   %ebx,%ebx
80106c2e:	0f 84 cb 00 00 00    	je     80106cff <switchuvm+0xdf>
  if(p->kstack == 0)
80106c34:	8b 43 08             	mov    0x8(%ebx),%eax
80106c37:	85 c0                	test   %eax,%eax
80106c39:	0f 84 da 00 00 00    	je     80106d19 <switchuvm+0xf9>
  if(p->pgdir == 0)
80106c3f:	8b 43 04             	mov    0x4(%ebx),%eax
80106c42:	85 c0                	test   %eax,%eax
80106c44:	0f 84 c2 00 00 00    	je     80106d0c <switchuvm+0xec>
  pushcli();
80106c4a:	e8 b1 d6 ff ff       	call   80104300 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106c4f:	e8 5c cb ff ff       	call   801037b0 <mycpu>
80106c54:	89 c6                	mov    %eax,%esi
80106c56:	e8 55 cb ff ff       	call   801037b0 <mycpu>
80106c5b:	89 c7                	mov    %eax,%edi
80106c5d:	e8 4e cb ff ff       	call   801037b0 <mycpu>
80106c62:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106c65:	83 c7 08             	add    $0x8,%edi
80106c68:	e8 43 cb ff ff       	call   801037b0 <mycpu>
80106c6d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106c70:	83 c0 08             	add    $0x8,%eax
80106c73:	ba 67 00 00 00       	mov    $0x67,%edx
80106c78:	c1 e8 18             	shr    $0x18,%eax
80106c7b:	66 89 96 98 00 00 00 	mov    %dx,0x98(%esi)
80106c82:	66 89 be 9a 00 00 00 	mov    %di,0x9a(%esi)
80106c89:	88 86 9f 00 00 00    	mov    %al,0x9f(%esi)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106c8f:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106c94:	83 c1 08             	add    $0x8,%ecx
80106c97:	c1 e9 10             	shr    $0x10,%ecx
80106c9a:	88 8e 9c 00 00 00    	mov    %cl,0x9c(%esi)
80106ca0:	b9 99 40 00 00       	mov    $0x4099,%ecx
80106ca5:	66 89 8e 9d 00 00 00 	mov    %cx,0x9d(%esi)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106cac:	be 10 00 00 00       	mov    $0x10,%esi
  mycpu()->gdt[SEG_TSS].s = 0;
80106cb1:	e8 fa ca ff ff       	call   801037b0 <mycpu>
80106cb6:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106cbd:	e8 ee ca ff ff       	call   801037b0 <mycpu>
80106cc2:	66 89 70 10          	mov    %si,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106cc6:	8b 73 08             	mov    0x8(%ebx),%esi
80106cc9:	e8 e2 ca ff ff       	call   801037b0 <mycpu>
80106cce:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106cd4:	89 70 0c             	mov    %esi,0xc(%eax)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106cd7:	e8 d4 ca ff ff       	call   801037b0 <mycpu>
80106cdc:	66 89 78 6e          	mov    %di,0x6e(%eax)
  asm volatile("ltr %0" : : "r" (sel));
80106ce0:	b8 28 00 00 00       	mov    $0x28,%eax
80106ce5:	0f 00 d8             	ltr    %ax
  lcr3(V2P(p->pgdir));  // switch to process's address space
80106ce8:	8b 43 04             	mov    0x4(%ebx),%eax
80106ceb:	05 00 00 00 80       	add    $0x80000000,%eax
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106cf0:	0f 22 d8             	mov    %eax,%cr3
}
80106cf3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106cf6:	5b                   	pop    %ebx
80106cf7:	5e                   	pop    %esi
80106cf8:	5f                   	pop    %edi
80106cf9:	5d                   	pop    %ebp
  popcli();
80106cfa:	e9 41 d6 ff ff       	jmp    80104340 <popcli>
    panic("switchuvm: no process");
80106cff:	83 ec 0c             	sub    $0xc,%esp
80106d02:	68 4e 7c 10 80       	push   $0x80107c4e
80106d07:	e8 84 96 ff ff       	call   80100390 <panic>
    panic("switchuvm: no pgdir");
80106d0c:	83 ec 0c             	sub    $0xc,%esp
80106d0f:	68 79 7c 10 80       	push   $0x80107c79
80106d14:	e8 77 96 ff ff       	call   80100390 <panic>
    panic("switchuvm: no kstack");
80106d19:	83 ec 0c             	sub    $0xc,%esp
80106d1c:	68 64 7c 10 80       	push   $0x80107c64
80106d21:	e8 6a 96 ff ff       	call   80100390 <panic>
80106d26:	8d 76 00             	lea    0x0(%esi),%esi
80106d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106d30 <inituvm>:
{
80106d30:	55                   	push   %ebp
80106d31:	89 e5                	mov    %esp,%ebp
80106d33:	57                   	push   %edi
80106d34:	56                   	push   %esi
80106d35:	53                   	push   %ebx
80106d36:	83 ec 1c             	sub    $0x1c,%esp
80106d39:	8b 75 10             	mov    0x10(%ebp),%esi
80106d3c:	8b 55 08             	mov    0x8(%ebp),%edx
80106d3f:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(sz >= PGSIZE)
80106d42:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106d48:	77 50                	ja     80106d9a <inituvm+0x6a>
80106d4a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  mem = kalloc();
80106d4d:	e8 7e b7 ff ff       	call   801024d0 <kalloc>
  memset(mem, 0, PGSIZE);
80106d52:	83 ec 04             	sub    $0x4,%esp
  mem = kalloc();
80106d55:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106d57:	68 00 10 00 00       	push   $0x1000
80106d5c:	6a 00                	push   $0x0
80106d5e:	50                   	push   %eax
80106d5f:	e8 7c d7 ff ff       	call   801044e0 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106d64:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106d67:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106d6d:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
80106d74:	50                   	push   %eax
80106d75:	68 00 10 00 00       	push   $0x1000
80106d7a:	6a 00                	push   $0x0
80106d7c:	52                   	push   %edx
80106d7d:	e8 ee fd ff ff       	call   80106b70 <mappages>
  memmove(mem, init, sz);
80106d82:	89 75 10             	mov    %esi,0x10(%ebp)
80106d85:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106d88:	83 c4 20             	add    $0x20,%esp
80106d8b:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106d8e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d91:	5b                   	pop    %ebx
80106d92:	5e                   	pop    %esi
80106d93:	5f                   	pop    %edi
80106d94:	5d                   	pop    %ebp
  memmove(mem, init, sz);
80106d95:	e9 f6 d7 ff ff       	jmp    80104590 <memmove>
    panic("inituvm: more than a page");
80106d9a:	83 ec 0c             	sub    $0xc,%esp
80106d9d:	68 8d 7c 10 80       	push   $0x80107c8d
80106da2:	e8 e9 95 ff ff       	call   80100390 <panic>
80106da7:	89 f6                	mov    %esi,%esi
80106da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106db0 <loaduvm>:
{
80106db0:	55                   	push   %ebp
80106db1:	89 e5                	mov    %esp,%ebp
80106db3:	57                   	push   %edi
80106db4:	56                   	push   %esi
80106db5:	53                   	push   %ebx
80106db6:	83 ec 0c             	sub    $0xc,%esp
  if((uint) addr % PGSIZE != 0)
80106db9:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106dc0:	0f 85 91 00 00 00    	jne    80106e57 <loaduvm+0xa7>
  for(i = 0; i < sz; i += PGSIZE){
80106dc6:	8b 75 18             	mov    0x18(%ebp),%esi
80106dc9:	31 db                	xor    %ebx,%ebx
80106dcb:	85 f6                	test   %esi,%esi
80106dcd:	75 1a                	jne    80106de9 <loaduvm+0x39>
80106dcf:	eb 6f                	jmp    80106e40 <loaduvm+0x90>
80106dd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106dd8:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106dde:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106de4:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106de7:	76 57                	jbe    80106e40 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106de9:	8b 55 0c             	mov    0xc(%ebp),%edx
80106dec:	8b 45 08             	mov    0x8(%ebp),%eax
80106def:	31 c9                	xor    %ecx,%ecx
80106df1:	01 da                	add    %ebx,%edx
80106df3:	e8 c8 fb ff ff       	call   801069c0 <walkpgdir>
80106df8:	85 c0                	test   %eax,%eax
80106dfa:	74 4e                	je     80106e4a <loaduvm+0x9a>
    pa = PTE_ADDR(*pte);
80106dfc:	8b 00                	mov    (%eax),%eax
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106dfe:	8b 4d 14             	mov    0x14(%ebp),%ecx
    if(sz - i < PGSIZE)
80106e01:	bf 00 10 00 00       	mov    $0x1000,%edi
    pa = PTE_ADDR(*pte);
80106e06:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106e0b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106e11:	0f 46 fe             	cmovbe %esi,%edi
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106e14:	01 d9                	add    %ebx,%ecx
80106e16:	05 00 00 00 80       	add    $0x80000000,%eax
80106e1b:	57                   	push   %edi
80106e1c:	51                   	push   %ecx
80106e1d:	50                   	push   %eax
80106e1e:	ff 75 10             	pushl  0x10(%ebp)
80106e21:	e8 4a ab ff ff       	call   80101970 <readi>
80106e26:	83 c4 10             	add    $0x10,%esp
80106e29:	39 f8                	cmp    %edi,%eax
80106e2b:	74 ab                	je     80106dd8 <loaduvm+0x28>
}
80106e2d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106e30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106e35:	5b                   	pop    %ebx
80106e36:	5e                   	pop    %esi
80106e37:	5f                   	pop    %edi
80106e38:	5d                   	pop    %ebp
80106e39:	c3                   	ret    
80106e3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106e40:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106e43:	31 c0                	xor    %eax,%eax
}
80106e45:	5b                   	pop    %ebx
80106e46:	5e                   	pop    %esi
80106e47:	5f                   	pop    %edi
80106e48:	5d                   	pop    %ebp
80106e49:	c3                   	ret    
      panic("loaduvm: address should exist");
80106e4a:	83 ec 0c             	sub    $0xc,%esp
80106e4d:	68 a7 7c 10 80       	push   $0x80107ca7
80106e52:	e8 39 95 ff ff       	call   80100390 <panic>
    panic("loaduvm: addr must be page aligned");
80106e57:	83 ec 0c             	sub    $0xc,%esp
80106e5a:	68 30 7d 10 80       	push   $0x80107d30
80106e5f:	e8 2c 95 ff ff       	call   80100390 <panic>
80106e64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106e6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106e70 <allocuvm>:
{
80106e70:	55                   	push   %ebp
80106e71:	89 e5                	mov    %esp,%ebp
80106e73:	57                   	push   %edi
80106e74:	56                   	push   %esi
80106e75:	53                   	push   %ebx
80106e76:	83 ec 1c             	sub    $0x1c,%esp
  if(newsz >= KERNBASE)
80106e79:	8b 7d 10             	mov    0x10(%ebp),%edi
80106e7c:	85 ff                	test   %edi,%edi
80106e7e:	0f 88 8f 00 00 00    	js     80106f13 <allocuvm+0xa3>
  if(newsz < oldsz)
80106e84:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106e87:	0f 82 93 00 00 00    	jb     80106f20 <allocuvm+0xb0>
  a = PGROUNDUP(oldsz);
80106e8d:	8b 45 0c             	mov    0xc(%ebp),%eax
80106e90:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106e96:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106e9c:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80106e9f:	0f 86 7e 00 00 00    	jbe    80106f23 <allocuvm+0xb3>
80106ea5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80106ea8:	8b 75 08             	mov    0x8(%ebp),%esi
80106eab:	eb 43                	jmp    80106ef0 <allocuvm+0x80>
80106ead:	8d 76 00             	lea    0x0(%esi),%esi
    memset(mem, 0, PGSIZE);
80106eb0:	83 ec 04             	sub    $0x4,%esp
80106eb3:	68 00 10 00 00       	push   $0x1000
80106eb8:	6a 00                	push   $0x0
80106eba:	50                   	push   %eax
80106ebb:	e8 20 d6 ff ff       	call   801044e0 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106ec0:	8d 87 00 00 00 80    	lea    -0x80000000(%edi),%eax
80106ec6:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
80106ecd:	50                   	push   %eax
80106ece:	68 00 10 00 00       	push   $0x1000
80106ed3:	53                   	push   %ebx
80106ed4:	56                   	push   %esi
80106ed5:	e8 96 fc ff ff       	call   80106b70 <mappages>
80106eda:	83 c4 20             	add    $0x20,%esp
80106edd:	85 c0                	test   %eax,%eax
80106edf:	78 4f                	js     80106f30 <allocuvm+0xc0>
  for(; a < newsz; a += PGSIZE){
80106ee1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106ee7:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80106eea:	0f 86 80 00 00 00    	jbe    80106f70 <allocuvm+0x100>
		mem = kalloc();		
80106ef0:	e8 db b5 ff ff       	call   801024d0 <kalloc>
    if(mem == 0){
80106ef5:	85 c0                	test   %eax,%eax
		mem = kalloc();		
80106ef7:	89 c7                	mov    %eax,%edi
    if(mem == 0){
80106ef9:	75 b5                	jne    80106eb0 <allocuvm+0x40>
      cprintf("allocuvm out of memory\n");
80106efb:	83 ec 0c             	sub    $0xc,%esp
80106efe:	68 bd 7a 10 80       	push   $0x80107abd
80106f03:	e8 58 97 ff ff       	call   80100660 <cprintf>
  if(newsz >= oldsz)
80106f08:	83 c4 10             	add    $0x10,%esp
80106f0b:	8b 45 0c             	mov    0xc(%ebp),%eax
80106f0e:	39 45 10             	cmp    %eax,0x10(%ebp)
80106f11:	77 6d                	ja     80106f80 <allocuvm+0x110>
}
80106f13:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
80106f16:	31 ff                	xor    %edi,%edi
}
80106f18:	89 f8                	mov    %edi,%eax
80106f1a:	5b                   	pop    %ebx
80106f1b:	5e                   	pop    %esi
80106f1c:	5f                   	pop    %edi
80106f1d:	5d                   	pop    %ebp
80106f1e:	c3                   	ret    
80106f1f:	90                   	nop
    return oldsz;
80106f20:	8b 7d 0c             	mov    0xc(%ebp),%edi
}
80106f23:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f26:	89 f8                	mov    %edi,%eax
80106f28:	5b                   	pop    %ebx
80106f29:	5e                   	pop    %esi
80106f2a:	5f                   	pop    %edi
80106f2b:	5d                   	pop    %ebp
80106f2c:	c3                   	ret    
80106f2d:	8d 76 00             	lea    0x0(%esi),%esi
      cprintf("allocuvm out of memory (2)\n");
80106f30:	83 ec 0c             	sub    $0xc,%esp
80106f33:	89 fe                	mov    %edi,%esi
80106f35:	68 c5 7c 10 80       	push   $0x80107cc5
80106f3a:	e8 21 97 ff ff       	call   80100660 <cprintf>
  if(newsz >= oldsz)
80106f3f:	83 c4 10             	add    $0x10,%esp
80106f42:	8b 45 0c             	mov    0xc(%ebp),%eax
80106f45:	39 45 10             	cmp    %eax,0x10(%ebp)
80106f48:	76 0d                	jbe    80106f57 <allocuvm+0xe7>
80106f4a:	89 c1                	mov    %eax,%ecx
80106f4c:	8b 55 10             	mov    0x10(%ebp),%edx
80106f4f:	8b 45 08             	mov    0x8(%ebp),%eax
80106f52:	e8 e9 fa ff ff       	call   80106a40 <deallocuvm.part.0>
      kfree(mem);
80106f57:	83 ec 0c             	sub    $0xc,%esp
      return 0;
80106f5a:	31 ff                	xor    %edi,%edi
      kfree(mem);
80106f5c:	56                   	push   %esi
80106f5d:	e8 be b3 ff ff       	call   80102320 <kfree>
      return 0;
80106f62:	83 c4 10             	add    $0x10,%esp
}
80106f65:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f68:	89 f8                	mov    %edi,%eax
80106f6a:	5b                   	pop    %ebx
80106f6b:	5e                   	pop    %esi
80106f6c:	5f                   	pop    %edi
80106f6d:	5d                   	pop    %ebp
80106f6e:	c3                   	ret    
80106f6f:	90                   	nop
80106f70:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80106f73:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f76:	5b                   	pop    %ebx
80106f77:	89 f8                	mov    %edi,%eax
80106f79:	5e                   	pop    %esi
80106f7a:	5f                   	pop    %edi
80106f7b:	5d                   	pop    %ebp
80106f7c:	c3                   	ret    
80106f7d:	8d 76 00             	lea    0x0(%esi),%esi
80106f80:	89 c1                	mov    %eax,%ecx
80106f82:	8b 55 10             	mov    0x10(%ebp),%edx
80106f85:	8b 45 08             	mov    0x8(%ebp),%eax
80106f88:	e8 b3 fa ff ff       	call   80106a40 <deallocuvm.part.0>
80106f8d:	eb 94                	jmp    80106f23 <allocuvm+0xb3>
80106f8f:	90                   	nop

80106f90 <deallocuvm>:
{
80106f90:	55                   	push   %ebp
80106f91:	89 e5                	mov    %esp,%ebp
80106f93:	8b 55 0c             	mov    0xc(%ebp),%edx
80106f96:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106f99:	8b 45 08             	mov    0x8(%ebp),%eax
  if(newsz >= oldsz)
80106f9c:	39 d1                	cmp    %edx,%ecx
80106f9e:	73 10                	jae    80106fb0 <deallocuvm+0x20>
}
80106fa0:	5d                   	pop    %ebp
80106fa1:	e9 9a fa ff ff       	jmp    80106a40 <deallocuvm.part.0>
80106fa6:	8d 76 00             	lea    0x0(%esi),%esi
80106fa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106fb0:	89 d0                	mov    %edx,%eax
80106fb2:	5d                   	pop    %ebp
80106fb3:	c3                   	ret    
80106fb4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106fba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106fc0 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80106fc0:	55                   	push   %ebp
80106fc1:	89 e5                	mov    %esp,%ebp
80106fc3:	57                   	push   %edi
80106fc4:	56                   	push   %esi
80106fc5:	53                   	push   %ebx
80106fc6:	83 ec 0c             	sub    $0xc,%esp
80106fc9:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
80106fcc:	85 f6                	test   %esi,%esi
80106fce:	74 59                	je     80107029 <freevm+0x69>
80106fd0:	31 c9                	xor    %ecx,%ecx
80106fd2:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106fd7:	89 f0                	mov    %esi,%eax
80106fd9:	e8 62 fa ff ff       	call   80106a40 <deallocuvm.part.0>
80106fde:	89 f3                	mov    %esi,%ebx
80106fe0:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106fe6:	eb 0f                	jmp    80106ff7 <freevm+0x37>
80106fe8:	90                   	nop
80106fe9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ff0:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106ff3:	39 fb                	cmp    %edi,%ebx
80106ff5:	74 23                	je     8010701a <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80106ff7:	8b 03                	mov    (%ebx),%eax
80106ff9:	a8 01                	test   $0x1,%al
80106ffb:	74 f3                	je     80106ff0 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106ffd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
      kfree(v);
80107002:	83 ec 0c             	sub    $0xc,%esp
80107005:	83 c3 04             	add    $0x4,%ebx
      char * v = P2V(PTE_ADDR(pgdir[i]));
80107008:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
8010700d:	50                   	push   %eax
8010700e:	e8 0d b3 ff ff       	call   80102320 <kfree>
80107013:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < NPDENTRIES; i++){
80107016:	39 fb                	cmp    %edi,%ebx
80107018:	75 dd                	jne    80106ff7 <freevm+0x37>
    }
  }
  kfree((char*)pgdir);
8010701a:	89 75 08             	mov    %esi,0x8(%ebp)
}
8010701d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107020:	5b                   	pop    %ebx
80107021:	5e                   	pop    %esi
80107022:	5f                   	pop    %edi
80107023:	5d                   	pop    %ebp
  kfree((char*)pgdir);
80107024:	e9 f7 b2 ff ff       	jmp    80102320 <kfree>
    panic("freevm: no pgdir");
80107029:	83 ec 0c             	sub    $0xc,%esp
8010702c:	68 e1 7c 10 80       	push   $0x80107ce1
80107031:	e8 5a 93 ff ff       	call   80100390 <panic>
80107036:	8d 76 00             	lea    0x0(%esi),%esi
80107039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107040 <setupkvm>:
{
80107040:	55                   	push   %ebp
80107041:	89 e5                	mov    %esp,%ebp
80107043:	56                   	push   %esi
80107044:	53                   	push   %ebx
  if((pgdir = (pde_t*)kalloc()) == 0)
80107045:	e8 86 b4 ff ff       	call   801024d0 <kalloc>
8010704a:	85 c0                	test   %eax,%eax
8010704c:	89 c6                	mov    %eax,%esi
8010704e:	74 42                	je     80107092 <setupkvm+0x52>
  memset(pgdir, 0, PGSIZE);
80107050:	83 ec 04             	sub    $0x4,%esp
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107053:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  memset(pgdir, 0, PGSIZE);
80107058:	68 00 10 00 00       	push   $0x1000
8010705d:	6a 00                	push   $0x0
8010705f:	50                   	push   %eax
80107060:	e8 7b d4 ff ff       	call   801044e0 <memset>
80107065:	83 c4 10             	add    $0x10,%esp
                (uint)k->phys_start, k->perm) < 0) {
80107068:	8b 43 04             	mov    0x4(%ebx),%eax
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
8010706b:	8b 53 08             	mov    0x8(%ebx),%edx
8010706e:	83 ec 0c             	sub    $0xc,%esp
80107071:	ff 73 0c             	pushl  0xc(%ebx)
80107074:	29 c2                	sub    %eax,%edx
80107076:	50                   	push   %eax
80107077:	52                   	push   %edx
80107078:	ff 33                	pushl  (%ebx)
8010707a:	56                   	push   %esi
8010707b:	e8 f0 fa ff ff       	call   80106b70 <mappages>
80107080:	83 c4 20             	add    $0x20,%esp
80107083:	85 c0                	test   %eax,%eax
80107085:	78 19                	js     801070a0 <setupkvm+0x60>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107087:	83 c3 10             	add    $0x10,%ebx
8010708a:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80107090:	75 d6                	jne    80107068 <setupkvm+0x28>
}
80107092:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107095:	89 f0                	mov    %esi,%eax
80107097:	5b                   	pop    %ebx
80107098:	5e                   	pop    %esi
80107099:	5d                   	pop    %ebp
8010709a:	c3                   	ret    
8010709b:	90                   	nop
8010709c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      freevm(pgdir);
801070a0:	83 ec 0c             	sub    $0xc,%esp
801070a3:	56                   	push   %esi
      return 0;
801070a4:	31 f6                	xor    %esi,%esi
      freevm(pgdir);
801070a6:	e8 15 ff ff ff       	call   80106fc0 <freevm>
      return 0;
801070ab:	83 c4 10             	add    $0x10,%esp
}
801070ae:	8d 65 f8             	lea    -0x8(%ebp),%esp
801070b1:	89 f0                	mov    %esi,%eax
801070b3:	5b                   	pop    %ebx
801070b4:	5e                   	pop    %esi
801070b5:	5d                   	pop    %ebp
801070b6:	c3                   	ret    
801070b7:	89 f6                	mov    %esi,%esi
801070b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801070c0 <kvmalloc>:
{
801070c0:	55                   	push   %ebp
801070c1:	89 e5                	mov    %esp,%ebp
801070c3:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
801070c6:	e8 75 ff ff ff       	call   80107040 <setupkvm>
801070cb:	a3 a4 5d 11 80       	mov    %eax,0x80115da4
  lcr3(V2P(kpgdir));   // switch to the kernel page table
801070d0:	05 00 00 00 80       	add    $0x80000000,%eax
801070d5:	0f 22 d8             	mov    %eax,%cr3
}
801070d8:	c9                   	leave  
801070d9:	c3                   	ret    
801070da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801070e0 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
801070e0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801070e1:	31 c9                	xor    %ecx,%ecx
{
801070e3:	89 e5                	mov    %esp,%ebp
801070e5:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
801070e8:	8b 55 0c             	mov    0xc(%ebp),%edx
801070eb:	8b 45 08             	mov    0x8(%ebp),%eax
801070ee:	e8 cd f8 ff ff       	call   801069c0 <walkpgdir>
  if(pte == 0)
801070f3:	85 c0                	test   %eax,%eax
801070f5:	74 05                	je     801070fc <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
801070f7:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
801070fa:	c9                   	leave  
801070fb:	c3                   	ret    
    panic("clearpteu");
801070fc:	83 ec 0c             	sub    $0xc,%esp
801070ff:	68 f2 7c 10 80       	push   $0x80107cf2
80107104:	e8 87 92 ff ff       	call   80100390 <panic>
80107109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80107110 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80107110:	55                   	push   %ebp
80107111:	89 e5                	mov    %esp,%ebp
80107113:	57                   	push   %edi
80107114:	56                   	push   %esi
80107115:	53                   	push   %ebx
80107116:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80107119:	e8 22 ff ff ff       	call   80107040 <setupkvm>
8010711e:	85 c0                	test   %eax,%eax
80107120:	89 45 e0             	mov    %eax,-0x20(%ebp)
80107123:	0f 84 a2 00 00 00    	je     801071cb <copyuvm+0xbb>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80107129:	8b 55 0c             	mov    0xc(%ebp),%edx
8010712c:	85 d2                	test   %edx,%edx
8010712e:	0f 84 97 00 00 00    	je     801071cb <copyuvm+0xbb>
80107134:	31 f6                	xor    %esi,%esi
80107136:	eb 48                	jmp    80107180 <copyuvm+0x70>
80107138:	90                   	nop
80107139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80107140:	83 ec 04             	sub    $0x4,%esp
80107143:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
80107149:	68 00 10 00 00       	push   $0x1000
8010714e:	53                   	push   %ebx
8010714f:	50                   	push   %eax
80107150:	e8 3b d4 ff ff       	call   80104590 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
80107155:	58                   	pop    %eax
80107156:	8d 87 00 00 00 80    	lea    -0x80000000(%edi),%eax
8010715c:	ff 75 e4             	pushl  -0x1c(%ebp)
8010715f:	50                   	push   %eax
80107160:	68 00 10 00 00       	push   $0x1000
80107165:	56                   	push   %esi
80107166:	ff 75 e0             	pushl  -0x20(%ebp)
80107169:	e8 02 fa ff ff       	call   80106b70 <mappages>
8010716e:	83 c4 20             	add    $0x20,%esp
80107171:	85 c0                	test   %eax,%eax
80107173:	78 6b                	js     801071e0 <copyuvm+0xd0>
  for(i = 0; i < sz; i += PGSIZE){
80107175:	81 c6 00 10 00 00    	add    $0x1000,%esi
8010717b:	39 75 0c             	cmp    %esi,0xc(%ebp)
8010717e:	76 4b                	jbe    801071cb <copyuvm+0xbb>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80107180:	8b 45 08             	mov    0x8(%ebp),%eax
80107183:	31 c9                	xor    %ecx,%ecx
80107185:	89 f2                	mov    %esi,%edx
80107187:	e8 34 f8 ff ff       	call   801069c0 <walkpgdir>
8010718c:	85 c0                	test   %eax,%eax
8010718e:	74 6b                	je     801071fb <copyuvm+0xeb>
    if(!(*pte & PTE_P))
80107190:	8b 38                	mov    (%eax),%edi
80107192:	f7 c7 01 00 00 00    	test   $0x1,%edi
80107198:	74 54                	je     801071ee <copyuvm+0xde>
    pa = PTE_ADDR(*pte);
8010719a:	89 fb                	mov    %edi,%ebx
    flags = PTE_FLAGS(*pte);
8010719c:	81 e7 ff 0f 00 00    	and    $0xfff,%edi
801071a2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
    pa = PTE_ADDR(*pte);
801071a5:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
    if((mem = kalloc()) == 0)
801071ab:	e8 20 b3 ff ff       	call   801024d0 <kalloc>
801071b0:	85 c0                	test   %eax,%eax
801071b2:	89 c7                	mov    %eax,%edi
801071b4:	75 8a                	jne    80107140 <copyuvm+0x30>
    }
  }
  return d;

bad:
  freevm(d);
801071b6:	83 ec 0c             	sub    $0xc,%esp
801071b9:	ff 75 e0             	pushl  -0x20(%ebp)
801071bc:	e8 ff fd ff ff       	call   80106fc0 <freevm>
  return 0;
801071c1:	83 c4 10             	add    $0x10,%esp
801071c4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
}
801071cb:	8b 45 e0             	mov    -0x20(%ebp),%eax
801071ce:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071d1:	5b                   	pop    %ebx
801071d2:	5e                   	pop    %esi
801071d3:	5f                   	pop    %edi
801071d4:	5d                   	pop    %ebp
801071d5:	c3                   	ret    
801071d6:	8d 76 00             	lea    0x0(%esi),%esi
801071d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      kfree(mem);
801071e0:	83 ec 0c             	sub    $0xc,%esp
801071e3:	57                   	push   %edi
801071e4:	e8 37 b1 ff ff       	call   80102320 <kfree>
      goto bad;
801071e9:	83 c4 10             	add    $0x10,%esp
801071ec:	eb c8                	jmp    801071b6 <copyuvm+0xa6>
      panic("copyuvm: page not present");
801071ee:	83 ec 0c             	sub    $0xc,%esp
801071f1:	68 16 7d 10 80       	push   $0x80107d16
801071f6:	e8 95 91 ff ff       	call   80100390 <panic>
      panic("copyuvm: pte should exist");
801071fb:	83 ec 0c             	sub    $0xc,%esp
801071fe:	68 fc 7c 10 80       	push   $0x80107cfc
80107203:	e8 88 91 ff ff       	call   80100390 <panic>
80107208:	90                   	nop
80107209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80107210 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80107210:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107211:	31 c9                	xor    %ecx,%ecx
{
80107213:	89 e5                	mov    %esp,%ebp
80107215:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
80107218:	8b 55 0c             	mov    0xc(%ebp),%edx
8010721b:	8b 45 08             	mov    0x8(%ebp),%eax
8010721e:	e8 9d f7 ff ff       	call   801069c0 <walkpgdir>
  if((*pte & PTE_P) == 0)
80107223:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
}
80107225:	c9                   	leave  
  if((*pte & PTE_U) == 0)
80107226:	89 c2                	mov    %eax,%edx
  return (char*)P2V(PTE_ADDR(*pte));
80107228:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((*pte & PTE_U) == 0)
8010722d:	83 e2 05             	and    $0x5,%edx
  return (char*)P2V(PTE_ADDR(*pte));
80107230:	05 00 00 00 80       	add    $0x80000000,%eax
80107235:	83 fa 05             	cmp    $0x5,%edx
80107238:	ba 00 00 00 00       	mov    $0x0,%edx
8010723d:	0f 45 c2             	cmovne %edx,%eax
}
80107240:	c3                   	ret    
80107241:	eb 0d                	jmp    80107250 <copyout>
80107243:	90                   	nop
80107244:	90                   	nop
80107245:	90                   	nop
80107246:	90                   	nop
80107247:	90                   	nop
80107248:	90                   	nop
80107249:	90                   	nop
8010724a:	90                   	nop
8010724b:	90                   	nop
8010724c:	90                   	nop
8010724d:	90                   	nop
8010724e:	90                   	nop
8010724f:	90                   	nop

80107250 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80107250:	55                   	push   %ebp
80107251:	89 e5                	mov    %esp,%ebp
80107253:	57                   	push   %edi
80107254:	56                   	push   %esi
80107255:	53                   	push   %ebx
80107256:	83 ec 1c             	sub    $0x1c,%esp
80107259:	8b 5d 14             	mov    0x14(%ebp),%ebx
8010725c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010725f:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107262:	85 db                	test   %ebx,%ebx
80107264:	75 40                	jne    801072a6 <copyout+0x56>
80107266:	eb 70                	jmp    801072d8 <copyout+0x88>
80107268:	90                   	nop
80107269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80107270:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107273:	89 f1                	mov    %esi,%ecx
80107275:	29 d1                	sub    %edx,%ecx
80107277:	81 c1 00 10 00 00    	add    $0x1000,%ecx
8010727d:	39 d9                	cmp    %ebx,%ecx
8010727f:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80107282:	29 f2                	sub    %esi,%edx
80107284:	83 ec 04             	sub    $0x4,%esp
80107287:	01 d0                	add    %edx,%eax
80107289:	51                   	push   %ecx
8010728a:	57                   	push   %edi
8010728b:	50                   	push   %eax
8010728c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010728f:	e8 fc d2 ff ff       	call   80104590 <memmove>
    len -= n;
    buf += n;
80107294:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  while(len > 0){
80107297:	83 c4 10             	add    $0x10,%esp
    va = va0 + PGSIZE;
8010729a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    buf += n;
801072a0:	01 cf                	add    %ecx,%edi
  while(len > 0){
801072a2:	29 cb                	sub    %ecx,%ebx
801072a4:	74 32                	je     801072d8 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
801072a6:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
801072a8:	83 ec 08             	sub    $0x8,%esp
    va0 = (uint)PGROUNDDOWN(va);
801072ab:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801072ae:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
801072b4:	56                   	push   %esi
801072b5:	ff 75 08             	pushl  0x8(%ebp)
801072b8:	e8 53 ff ff ff       	call   80107210 <uva2ka>
    if(pa0 == 0)
801072bd:	83 c4 10             	add    $0x10,%esp
801072c0:	85 c0                	test   %eax,%eax
801072c2:	75 ac                	jne    80107270 <copyout+0x20>
  }
  return 0;
}
801072c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
801072c7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801072cc:	5b                   	pop    %ebx
801072cd:	5e                   	pop    %esi
801072ce:	5f                   	pop    %edi
801072cf:	5d                   	pop    %ebp
801072d0:	c3                   	ret    
801072d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801072d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
801072db:	31 c0                	xor    %eax,%eax
}
801072dd:	5b                   	pop    %ebx
801072de:	5e                   	pop    %esi
801072df:	5f                   	pop    %edi
801072e0:	5d                   	pop    %ebp
801072e1:	c3                   	ret    
