import { useState } from 'react'
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, LineChart, Line, PieChart, Pie, Cell } from 'recharts'

export default function Dashboard() {
  const [stats] = useState({
    totalFarmers: 1247,
    activeProcurement: 23,
    warehouseCapacity: '85%',
    monthlyRevenue: '₹12.4L'
  })

  const chartData = [
    { name: 'Jan', procurement: 4000, sales: 2400 },
    { name: 'Feb', procurement: 3000, sales: 1398 },
    { name: 'Mar', procurement: 2000, sales: 9800 },
    { name: 'Apr', procurement: 2780, sales: 3908 },
    { name: 'May', procurement: 1890, sales: 4800 },
    { name: 'Jun', procurement: 2390, sales: 3800 },
  ]

  const cropDistribution = [
    { name: 'Soybean', value: 35, color: '#10B981' },
    { name: 'Mustard', value: 25, color: '#F59E0B' },
    { name: 'Groundnut', value: 20, color: '#3B82F6' },
    { name: 'Sunflower', value: 20, color: '#8B5CF6' },
  ]

  const recentOrders = [
    { id: 'ORD001', farmer: 'Ramesh Kumar', crop: 'Soybean', quantity: '500 kg', status: 'Pending', price: '₹27,500' },
    { id: 'ORD002', farmer: 'Priya Sharma', crop: 'Mustard', quantity: '300 kg', status: 'Approved', price: '₹18,600' },
    { id: 'ORD003', farmer: 'Suresh Patil', crop: 'Groundnut', quantity: '200 kg', status: 'In Transit', price: '₹13,000' },
    { id: 'ORD004', farmer: 'Sunita Devi', crop: 'Sunflower', quantity: '400 kg', status: 'Completed', price: '₹22,000' },
  ]

  const quickActions = [
    { title: 'New Procurement', icon: '🛒', color: 'from-green-500 to-green-600', desc: 'Browse available crops' },
    { title: 'Quality Check', icon: '🔍', color: 'from-blue-500 to-blue-600', desc: 'Inspect crop quality' },
    { title: 'Payment Release', icon: '💳', color: 'from-purple-500 to-purple-600', desc: 'Process farmer payments' },
    { title: 'Generate Report', icon: '📊', color: 'from-orange-500 to-orange-600', desc: 'Create analytics report' },
  ]

  return (
    <div className="p-6 bg-gradient-to-br from-gray-50 to-blue-50 min-h-screen">
      {/* Enhanced Header */}
      <div className="mb-8">
        <div className="flex items-center justify-between">
          <div>
            <h1 className="text-4xl font-bold bg-gradient-to-r from-green-600 via-blue-600 to-purple-600 bg-clip-text text-transparent mb-2">
              FPO Dashboard
            </h1>
            <p className="text-gray-600 text-lg">Welcome back! Here's your agricultural business overview.</p>
          </div>
          <div className="flex items-center space-x-4">
            <div className="bg-white rounded-2xl p-4 shadow-lg border border-gray-100">
              <span className="text-3xl">🌾</span>
            </div>
            <div className="text-right">
              <p className="text-sm text-gray-500 font-medium">Today</p>
              <p className="font-bold text-gray-900">{new Date().toLocaleDateString()}</p>
            </div>
          </div>
        </div>
      </div>

      {/* Enhanced Stats Cards */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
        <div className="bg-white rounded-3xl shadow-xl p-6 border border-gray-100 hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-2 hover:scale-105">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-semibold text-gray-500 uppercase tracking-wider">Total Farmers</p>
              <p className="text-3xl font-bold text-gray-900 mt-2">{stats.totalFarmers}</p>
            </div>
            <div className="bg-gradient-to-r from-blue-400 to-blue-600 p-4 rounded-2xl shadow-lg">
              <span className="text-3xl">👥</span>
            </div>
          </div>
          <div className="mt-4 flex items-center">
            <span className="text-blue-600 text-sm font-bold bg-blue-100 px-3 py-1 rounded-full">↗ +12%</span>
            <span className="text-gray-500 text-sm ml-2">vs last month</span>
          </div>
        </div>

        <div className="bg-white rounded-3xl shadow-xl p-6 border border-gray-100 hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-2 hover:scale-105">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-semibold text-gray-500 uppercase tracking-wider">Active Orders</p>
              <p className="text-3xl font-bold text-gray-900 mt-2">{stats.activeProcurement}</p>
            </div>
            <div className="bg-gradient-to-r from-yellow-400 to-orange-500 p-4 rounded-2xl shadow-lg">
              <span className="text-3xl">📦</span>
            </div>
          </div>
          <div className="mt-4 flex items-center">
            <span className="text-orange-600 text-sm font-bold bg-orange-100 px-3 py-1 rounded-full">⚡ Active</span>
            <span className="text-gray-500 text-sm ml-2">processing now</span>
          </div>
        </div>

        <div className="bg-white rounded-3xl shadow-xl p-6 border border-gray-100 hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-2 hover:scale-105">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-semibold text-gray-500 uppercase tracking-wider">Warehouse</p>
              <p className="text-3xl font-bold text-gray-900 mt-2">{stats.warehouseCapacity}</p>
            </div>
            <div className="bg-gradient-to-r from-green-400 to-green-600 p-4 rounded-2xl shadow-lg">
              <span className="text-3xl">🏪</span>
            </div>
          </div>
          <div className="mt-4 flex items-center">
            <span className="text-green-600 text-sm font-bold bg-green-100 px-3 py-1 rounded-full">✓ Good</span>
            <span className="text-gray-500 text-sm ml-2">capacity used</span>
          </div>
        </div>

        <div className="bg-white rounded-3xl shadow-xl p-6 border border-gray-100 hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-2 hover:scale-105">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-semibold text-gray-500 uppercase tracking-wider">Revenue</p>
              <p className="text-3xl font-bold text-gray-900 mt-2">{stats.monthlyRevenue}</p>
            </div>
            <div className="bg-gradient-to-r from-purple-400 to-purple-600 p-4 rounded-2xl shadow-lg">
              <span className="text-3xl">💰</span>
            </div>
          </div>
          <div className="mt-4 flex items-center">
            <span className="text-purple-600 text-sm font-bold bg-purple-100 px-3 py-1 rounded-full">↗ +18%</span>
            <span className="text-gray-500 text-sm ml-2">this month</span>
          </div>
        </div>
      </div>

      {/* Quick Actions */}
      <div className="mb-8">
        <h2 className="text-2xl font-bold text-gray-900 mb-6 flex items-center">
          <span className="mr-3">⚡</span>
          Quick Actions
        </h2>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
          {quickActions.map((action, index) => (
            <button key={index} className={`bg-gradient-to-r ${action.color} text-white p-6 rounded-2xl shadow-lg hover:shadow-xl transition-all duration-300 transform hover:-translate-y-1 hover:scale-105 group`}>
              <div className="flex items-center justify-between">
                <div className="text-left">
                  <p className="text-lg font-bold">{action.title}</p>
                  <p className="text-sm opacity-90 mt-1">{action.desc}</p>
                </div>
                <span className="text-3xl group-hover:scale-110 transition-transform duration-300">{action.icon}</span>
              </div>
            </button>
          ))}
        </div>
      </div>

      {/* Enhanced Charts Section */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-8">
        <div className="lg:col-span-2 bg-white rounded-3xl shadow-xl p-6 border border-gray-100">
          <h3 className="text-xl font-bold text-gray-900 mb-6 flex items-center">
            <span className="mr-3">📈</span>
            Procurement vs Sales Trend
          </h3>
          <ResponsiveContainer width="100%" height={350}>
            <BarChart data={chartData}>
              <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" />
              <XAxis dataKey="name" stroke="#6b7280" />
              <YAxis stroke="#6b7280" />
              <Tooltip 
                contentStyle={{ 
                  backgroundColor: '#fff', 
                  border: 'none', 
                  borderRadius: '16px', 
                  boxShadow: '0 20px 25px -5px rgba(0, 0, 0, 0.1)' 
                }} 
              />
              <Bar dataKey="procurement" fill="#10B981" radius={[8, 8, 0, 0]} />
              <Bar dataKey="sales" fill="#3B82F6" radius={[8, 8, 0, 0]} />
            </BarChart>
          </ResponsiveContainer>
        </div>

        <div className="bg-white rounded-3xl shadow-xl p-6 border border-gray-100">
          <h3 className="text-xl font-bold text-gray-900 mb-6 flex items-center">
            <span className="mr-3">🥜</span>
            Crop Distribution
          </h3>
          <ResponsiveContainer width="100%" height={250}>
            <PieChart>
              <Pie
                data={cropDistribution}
                cx="50%"
                cy="50%"
                innerRadius={60}
                outerRadius={100}
                paddingAngle={5}
                dataKey="value"
              >
                {cropDistribution.map((entry, index) => (
                  <Cell key={`cell-${index}`} fill={entry.color} />
                ))}
              </Pie>
              <Tooltip />
            </PieChart>
          </ResponsiveContainer>
          <div className="mt-4 space-y-3">
            {cropDistribution.map((crop, index) => (
              <div key={index} className="flex items-center justify-between p-2 rounded-lg hover:bg-gray-50">
                <div className="flex items-center">
                  <div className="w-4 h-4 rounded-full mr-3" style={{ backgroundColor: crop.color }}></div>
                  <span className="text-sm font-medium text-gray-700">{crop.name}</span>
                </div>
                <span className="text-sm font-bold text-gray-900 bg-gray-100 px-2 py-1 rounded-full">{crop.value}%</span>
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* Enhanced Recent Orders */}
      <div className="bg-white rounded-3xl shadow-xl border border-gray-100 overflow-hidden">
        <div className="px-6 py-4 bg-gradient-to-r from-gray-50 to-blue-50 border-b border-gray-200">
          <div className="flex items-center justify-between">
            <h3 className="text-xl font-bold text-gray-900 flex items-center">
              <span className="mr-3">📋</span>
              Recent Procurement Orders
            </h3>
            <button className="bg-gradient-to-r from-green-500 to-green-600 text-white px-6 py-2 rounded-xl hover:from-green-600 hover:to-green-700 transition-all duration-300 font-semibold shadow-lg hover:shadow-xl">
              View All Orders
            </button>
          </div>
        </div>
        <div className="overflow-x-auto">
          <table className="w-full">
            <thead className="bg-gray-50">
              <tr>
                <th className="px-6 py-4 text-left text-xs font-bold text-gray-600 uppercase tracking-wider">Order ID</th>
                <th className="px-6 py-4 text-left text-xs font-bold text-gray-600 uppercase tracking-wider">Farmer</th>
                <th className="px-6 py-4 text-left text-xs font-bold text-gray-600 uppercase tracking-wider">Crop</th>
                <th className="px-6 py-4 text-left text-xs font-bold text-gray-600 uppercase tracking-wider">Quantity</th>
                <th className="px-6 py-4 text-left text-xs font-bold text-gray-600 uppercase tracking-wider">Price</th>
                <th className="px-6 py-4 text-left text-xs font-bold text-gray-600 uppercase tracking-wider">Status</th>
              </tr>
            </thead>
            <tbody className="bg-white divide-y divide-gray-100">
              {recentOrders.map((order, index) => (
                <tr key={order.id} className={`hover:bg-gradient-to-r hover:from-blue-50 hover:to-green-50 transition-all duration-200 ${index % 2 === 0 ? 'bg-gray-25' : ''}`}>
                  <td className="px-6 py-4 whitespace-nowrap text-sm font-bold text-gray-900">{order.id}</td>
                  <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{order.farmer}</td>
                  <td className="px-6 py-4 whitespace-nowrap">
                    <span className="bg-green-100 text-green-800 px-3 py-1 rounded-full text-xs font-bold">
                      {order.crop}
                    </span>
                  </td>
                  <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{order.quantity}</td>
                  <td className="px-6 py-4 whitespace-nowrap text-sm font-bold text-gray-900">{order.price}</td>
                  <td className="px-6 py-4 whitespace-nowrap">
                    <span className={`inline-flex px-3 py-1 text-xs font-bold rounded-full uppercase tracking-wide ${
                      order.status === 'Completed' ? 'bg-green-100 text-green-800' :
                      order.status === 'Approved' ? 'bg-blue-100 text-blue-800' :
                      order.status === 'In Transit' ? 'bg-purple-100 text-purple-800' :
                      'bg-yellow-100 text-yellow-800'
                    }`}>
                      {order.status}
                    </span>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  )
}