## What is VPC, Subnets, Internet Gateway and NAT Gateway?

You can Imagine you're building a virtual spacé for the company GatoGrowFast.com's so that the computers can communicate securely. That's what VPC, or Virtual Private Cloud, is all about. It's like creating a private room in the cloud just for GatoGrowFast.com's use.

Here's an example: Think of GatoGrowFast.com's office building. Inside, there are different departments like HR, Finance, and IT. Each department has its own area with specific access rules. Similarly, in a VPC, GatoGrowFast.com can create different sections, called subnets, for different parts of the business.

Now, let's say GatoGrowFast.com wants to connect its office to the internet. They'd use a router to control the flow of data in and out of the building. In a VPC, GatoGrowFast.com has something similar called an Internet Gateway. It lets their VPC communicate with the internet securely.

NAT (Network Address Translation) Gateway as a secret agent between GatoGrowFast.com's computers and the internet. When a computer inside their virtual office wants to talk to the internet, the NAT Gateway steps in. It translates the computer's message and sends it out, but it hides who sent it. It's like sending a letter without your return address. This way, the internet only sees the NAT Gateway's address, keeping GatoGrowFast.com's computers safe and anonymous online.

Note- A router is a device that directs data packets between computer networks. Think of it as a traffic cop for the internet. When data is sent from one device to another across a network, it's broken down into smaller packets. These packets need to find their way to the correct destination, and that's where the router comes in.

Imagine you're sending a letter to a friend across the country. You drop it in a mailbox, and it's picked up by a postal worker. The postal worker knows which roads to take and which sorting centers to pass through to ensure your letter reaches its destination. Similarly, a router knows how to send data packets from your device to the right destination on the internet. Routers use routing tables, which are like maps of the internet, to determine the best path for data packets to take. They analyze information in the packets, such as destination IP addresses, to make these decisions. Once the packets reach their destination, the router ensures they're delivered to the correct device.

## What is an IP address?

An IP address is like a phone number for your computer. It's a unique set of numbers that helps computers find and talk to each other on a network, like the internet.

There are two main types of IP addresses: public IP addresses and private IP addresses. However, each type has different versions, with IPv4 and IPvo being the most common.

**Public IP Address:** This is like your home address. It's unique and helps other computers on the internet find yours. Just like how people send letters to your house using your address, data packets are sent to your computer using its public IP address.

* A public IP address is globally unique and is assigned by the Internet Service Provider (ISP) to a device connected to the internet.
* It allows devices to communicate with other devices across the internet.
* Public IP addresses can be either dynamic or static. Dynamic IPs change periodically, often each time a device reconnects to the internet, while static IPs remain constant. Static IPs are typically used for servers, remote access, or services that require consistent connectivity.

**Private IP Address:** Think of this like an internal extension number in a big office building. It's used for communication within a specific network, like your home Wi-Fi network or an office network. Devices within the same network can talk to each other using their private IP addresses, but these addresses aren't visible to the outside world.

* Private IP addresses are typically assigned by a router or a DHCP (Dynamic Host Configuration Protocol) server within the network.
* Devices within the same private network communicate with each other using their private IP addresses.
* These addresses are not routable over the internet. They are used for internal network communication only and are hidden from the outside world.
* It is not globally unique and can be reused within different private networks without conflict.

**IPv4 Address:**

* IPv4 (Internet Protocol version 4) addresses are the most common type of IP addresses used today.
* They are 32-bit numeric addresses written in decimal format, separated by periods (e.g., 192.168.0.1).
* IPv4 addresses are divided into five classes: A, B, C, D, and E, with classes A, B, and C being used for addressing hosts on networks.
* Each octet in an IPv4 address can have a value between 0 and 255. This is because each octet is made up of eight bits, and the maximum value that can be represented with eight bits is 255 (which is 11111111 in binary).

**Pv6 Address:**

* IPv6 (Internet Protocol version 6) addresses are designed to replace IPv due to the exhaustion of available IPv4 addresses.

IPvo addresses are 128-bit hexadecimal addresses, represented in eight groups of four hexadecimal digits separated by colons (e.g., 2001:0db8:85a3:0000:0000:8a2e: 037,0:7334).
IPv6 addresses provide a much larger address space compared to IPv4, allowing for a virtually unlimited number of unique addresses.

## What is CIDR?

CIDR, or Classless Inter-Domain Routing, makes it easier to talk about groups of IP addresses on the internet. Instead of naming each address one by one, CIDR uses a simple shortcut. It's like saying "All the houses on Main Street" instead of listing each house separately.

For example, let's say you have the IP address 192.168.1.0. With CIDR notation, you might write it like this:
192.168.1.0/24. The "/24" part tells us that we're talking about all the houses on that street from 192.168.1.0 to 192.168.1.255.

So, CIDR helps us manage and organize IP addresses on the internet in a way that's easy to understand and work with. It's like having a shorthand for talking about big groups of addresses.

Determining the number of available IP addresses in a CIDR block To determine the number of available IP addresses in a CIDR block, you calculate it using the formula:

`2^(32 - CIDR notation) - 2`

The '-2' is for excluding the network address and the broadcast address.

**Example**

Lets say we have a CIDR  block of '192.168.0.2/24'

Using the formular, we calculate

```
2^(32 - 24) - 2

=2^8 - 2

=256−2

=254
```
What is a gateway?

Gateways are like doorways between different networks. They help data travel between your local network and other networks, like the internet. Just like a gate lets you go from your backyard to the neighborhood park, a gateway lets your data go from your computer to the internet and back again. It's like the traffic cop of the internet, directing your data where it needs to go.

For example - Imagine you live in a city with different neighborhoods, each with its own set of houses. You're in ong neighborhood, let's call it Neighborhood A, and you want to visit a friend who lives in a different neighborhood, Neighborhood B. To get from your neighborhood to your friend's neighborhood, you need to go through a gateway-a special gate that connects the two neighborhoods. This gateway acts as a bridge between the two areas, allowing people and things to pass back and forth.

So, when you leave your house in Neighborhood A, you walk to the gateway, pass through it, and then find your friend's house in Neighborhood B. The gateway helps you navigate from one neighborhood to another, just like how a network gateway helps data travel between different networks.

What is a Route table?

A route table is like a map that helps data find its way around a network. Just like a map shows you the best routes to get from one place to another, a route table tells devices on a network how to send data packets to their destinations.

In simpler terms, a route table lists different destinations and the paths (or "routes") to reach them. When a device receives data that it needs to send somewhere, it consults the route table to figure out where to send it.

For example, if your computer wants to send data to a website, it looks at its route table to find out which gateway to use to reach the internet. The route table might say, "To reach the internet, send data to the router." Then, the router knows how to forward the data to the next stop on its journey, eventually reaching its destination.

Think of a route table as the navigation system for data on a network, helping it find the fastest and most efficient paths to where it needs to go.

Connection between Gateway and Route table

Gateways:

* Gateways are devices (like routers or firewalls) that serve as entry and exit points between different networks.
* They connect networks with different IP address ranges, such as your local network and the internet.
* Gateways receive incoming data packets and determine where to send them next based on routing information.

Route Tables:

* Route tables are tables maintained by networking devices (like routers or switches) that contain information about how to route data packets to their destinations.
* Each entry in a route table specifies a destination network and the next hop (gateway) to reach that network.
* Devices consult the route table to determine the best path for forwarding data packets based on their destination IP addresses.

Connection:

* When a device (like a computer or server) wants to send data to a destination outside of its local network, it checks its route table.
* The route table provides the information needed to determine the next hop (gateway) for reaching the destination network.
* The device then forwards the data packet to the specified gateway, which continues the process until the packet reaches its final destination.

In summary, gateways and route tables work together to facilitate the routing of network traffic between different networks. Gateways serve as the entry and exit points between networks, while route tables provide the necessary routing information to determine how data packets should be forwarded to their destinations.

Now let's come to the practical part,

Steps -

1. Setting Up a Virtual Private Cloud (VPC)
2. Configuring Subnets within the VPC
3. Creating Internet Gateway and attaching it to VPC
4. Enabling Internet Connectivity with the Internet Gateway by setting up Routing tables
5. Enabling Outbound Internet Access through NAT Gateway
6. Establishing VPC Peering Connections

Let’s come to the first one which involves setting up a virtual private cloud (VPC)

**Part-1**

1. Navigate tot eh search bar

a) Enter "VPC". Upon locating the relevant result, proceed to click on it, directly to the virtuala private cloud (VPC) page.

![](./img%201.png)

2. Please to the "Create VPC" option and click on it.

![](./img%202.png)

3. Please select the "VPC only" option, specify the IPv4 CIDR block, and proceed by clicking on the "Create VPC" button.

![](./img%203.png)

**Note-** If you encounter an error message statin that the CIDR block size must be between "/16" and "/28" when creating a vpc, it indicates that your provided CIDR block falls outside of this recommended range. Adjusting the CIDR block to fall within the specified range should resolve the issue.

![](./img%204.png)

This is the VPc we created,

![](./img%205.png)

You are done with the part 1 now, Let's move to part 2 which is configuring subnets within the VPC.

**Part -2**

1. Navigate to the "Subnets" option located at the left side bar

a) Upon clicking, you'll b e directed to the subnets page

b) From there proceed to click on the "Create subnet" button

